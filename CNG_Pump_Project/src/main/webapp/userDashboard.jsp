<%@ page import="java.sql.*"%>
<%@ page import="com.code.database.DBConnect"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.code.entity.User"%>
<%@ page session="true"%>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("userDashboard.jsp");
	return;
}

String selectedCity = request.getParameter("city");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<!-- Bootstrap JS Bundle (for modal) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.table th, .table td {
	vertical-align: middle;
}

.dashboard-container {
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2, h4 {
	color: #343a40;
}
</style>
</head>
<body>

	<div class="container mt-5 dashboard-container">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h2>
				Welcome,
				<%=user.getName()%>!
			</h2>
			<form action="logout" method="post">
				<button class="btn btn-danger">Logout</button>
			</form>
		</div>

		<h4 class="mb-3">Approved CNG Pumps</h4>

		<!-- Filter by City -->
		<form method="get" class="mb-4">
			<div class="row g-2">
				<div class="col-md-4">
					<select name="city" class="form-select"
						onchange="this.form.submit()">
						<option value="">-- View All Cities --</option>
						<%
						try {
							Connection con = DBConnect.getConnection();
							Statement stmt = con.createStatement();
							ResultSet cityRs = stmt.executeQuery("SELECT DISTINCT city FROM pump_owner WHERE status='approved'");
							while (cityRs.next()) {
								String city = cityRs.getString("city");
								String selected = city.equals(selectedCity) ? "selected" : "";
						%>
						<option value="<%=city%>" <%=selected%>><%=city%></option>
						<%
						}
						cityRs.close();
						stmt.close();
						con.close();
						} catch (Exception e) {
						out.println("<option>Error loading cities</option>");
						}
						%>
					</select>
				</div>
			</div>
		</form>

		<!-- Table of Pumps -->
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="table-dark text-center">
					<tr>
						<th>Pump Name</th>
						<th>City</th>
						<th>Opening Time</th>
						<th>Closing Time</th>
						<th>Booking</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<%
					try {
						Connection con = DBConnect.getConnection();
						String sql = "SELECT * FROM pump_owner WHERE status='approved'";
						if (selectedCity != null && !selectedCity.isEmpty()) {
							sql += " AND city=?";
						}

						PreparedStatement ps = con.prepareStatement(sql);
						if (selectedCity != null && !selectedCity.isEmpty()) {
							ps.setString(1, selectedCity);
						}

						ResultSet rs = ps.executeQuery();
						boolean found = false;
						while (rs.next()) {
							found = true;
					%>
					<tr>
						<td><%=rs.getString("pump_name")%></td>
						<td><%=rs.getString("city")%></td>
						<td><%=rs.getString("opening_time")%></td>
						<td><%=rs.getString("closing_time")%></td>
						<td>
    <%
        // Check if this pump is already booked by this user
        boolean isBooked = false;
        try {
            Connection con2 = DBConnect.getConnection();
            PreparedStatement bp = con2.prepareStatement("SELECT * FROM booking WHERE pump_name=? AND user_email=?");
            bp.setString(1, rs.getString("pump_name"));
            bp.setString(2, user.getEmail());
            ResultSet booked = bp.executeQuery();
            isBooked = booked.next();
            booked.close();
            bp.close();
            con2.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <% if (isBooked) { %>
        <button class="btn btn-secondary btn-sm" disabled>Booked</button>
    <% } else { %>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#bookModal<%= rs.getString("pump_name").replaceAll("\\s", "") %>">
            Book Slot
        </button>

        <!-- Modal -->
        <div class="modal fade" id="bookModal<%= rs.getString("pump_name").replaceAll("\\s", "") %>" tabindex="-1">
          <div class="modal-dialog">
            <div class="modal-content text-dark">
              <form method="post" action="BookSlot">
                  <div class="modal-header">
                    <h5 class="modal-title">Book Slot for <%= rs.getString("pump_name") %></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>
                  <div class="modal-body">
                      <input type="hidden" name="pump_name" value="<%= rs.getString("pump_name") %>">
                      <input type="hidden" name="user_email" value="<%= user.getEmail() %>">
                      <label>Select Time Slot:</label>
                      <select name="time_slot" class="form-select" required>
                          <option value="">-- Choose --</option>
                          <option value="08:00 AM - 09:00 AM">08:00 AM - 09:00 AM</option>
                          <option value="09:00 AM - 10:00 AM">09:00 AM - 10:00 AM</option>
                          <option value="10:00 AM - 11:00 AM">10:00 AM - 11:00 AM</option>
                          <option value="11:00 AM - 12:00 PM">11:00 AM - 12:00 PM</option>
                          <!-- Add more as needed -->
                      </select>
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Confirm Booking</button>
                  </div>
              </form>
            </div>
          </div>
        </div>
    <% } %>
</td>
						
					</tr>					

					<%
					}

					if (!found) {
					%>
					<tr>
						<td colspan="4" class="text-center">No approved pumps found<%=(selectedCity != null && !selectedCity.isEmpty()) ? " in " + selectedCity : ""%>.
						</td>
					</tr>
					<%
					}

					rs.close();
					ps.close();
					con.close();
					} catch (Exception e) {
					out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>

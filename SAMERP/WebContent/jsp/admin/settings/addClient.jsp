<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mysql.jdbc.ResultSet"%>
<%@page import="dao.General.GenericDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@ page import="utility.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SAMERP PROJECT</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/SAMERP/config/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/SAMERP/config/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/SAMERP/config/css/fullcalendar.css" />
<link rel="stylesheet" href="/SAMERP/config/css/matrix-style.css" />
<link rel="stylesheet" href="/SAMERP/config/css/matrix-media.css" />
<link href="/SAMERP/config/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/SAMERP/config/css/jquery.gritter.css" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>

<script type="text/javascript">

function getstr(id1) {
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var demoStr = this.responseText.split(",");
			document.getElementById("coname").value = demoStr[0];
			document.getElementById("cname").value = demoStr[1];
			document.getElementById("contactno1").value = demoStr[2];
			document.getElementById("contactno2").value = demoStr[3];
			document.getElementById("email").value = demoStr[4];
			document.getElementById("address").value = demoStr[5];
			document.getElementById("bamount").value=demoStr[6];
				
			}
		};
	xhttp.open("POST","/SAMERP/AddClient?update="+id1, true);
	xhttp.send();
}

function showmodal()
{

		document.getElementById("bankName").focus();
	    var x = document.getElementById("snackbar")
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	
		
}
	
</script>

<body onload="showmodal()">
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="index.html" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Form
					elements</a> <a href="#" class="current">Common elements</a>
			</div>
			<h1>Add Client Form</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span15">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-align-justify"></i>
							</span>
							<h5>Add Client</h5>
						</div>
						<div class="widget-content nopadding">
							<form action="/SAMERP/AddClient" method="Post"
								class="form-horizontal">
								<div class="control-group">
									<label class="control-label">Client Orgnization Name:</label>
									<div class="controls">
										<input type="text" name="coname" class="span6"
											placeholder="Client Orgnization Name" pattern="[a-z A-Z]*" required />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Client Name:</label>
									<div class="controls">
										<input type="text" name="cname" class="span6"
											placeholder="Client Name" pattern="[a-z A-Z]*" required />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Client Contact No1:</label>
									<div class="controls">
										<input type="text" name="contactno1" class="span6"
											placeholder="Client ContactNo1 " pattern="[0-9]*" required />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">Client Contact No2:</label>
									<div class="controls">
										<input type="text" name="contactno2" class="span6"
											placeholder="Enter Client ContactNo2 " pattern="[0-9]*" required />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">Client EmailId:</label>
									<div class="controls">
										<input type="email" class="span6"  name="email"
											placeholder="Client Email Id" required />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Client Address:</label>
									<div class="controls">
										<input type="text" class="span6" name="address"
											placeholder="Client Address"  pattern="[a-z A-Z]*" required />

									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Client Balance Amount:</label>
									<div class="controls">

										<input type="text" name="bamount"
											placeholder="Client Balance Amount" class="span6"
											pattern="[0-9]*" required />
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" name="insert" class="btn btn-success">Submit</button>
									<button type="submit" id="align1" class="btn btn-danger">Cancel</button>
								</div>
							</form>
						</div>
					</div>



	<div class="widget-box">
		<div class="widget-title">
			<span class="icon"><i class="icon-th"></i></span>
			<h5>Client Details Table</h5>
		</div>
		<div class="widget-content nopadding">
			<table class="table table-bordered data-table">
				<thead>
					<th>client_id</th>
					<th>client_orgnization_name</th>
					<th>client_name</th>
					<th>client_contactno1</th>
					<th>client_contactno2</th>
					<th>client_email</th>
					<th>client_address</th>
					<th>client_balance_amount</th>
					<th>Action</th>
				</thead>
				<%
					int id = 0,count=1;
					RequireData rd = new RequireData();
					List l = rd.getClientDetails();
					if (l != null) {
						Iterator itr = l.iterator();
				%>
				<tbody>
					<%
						while (itr.hasNext()) 
						{
							String id1 = itr.next().toString();
								
					%>
					<tr class="gradeX">
						<td id="<%=id1%>"><%=count%></td>
						<td><%=itr.next()%>
						<td><%=itr.next()%>
						<td><%=itr.next()%>
						<td><%=itr.next()%>
						<td><%=itr.next()%>
						<td><%=itr.next()%>
						<td><%=itr.next()%>
						<td><a href="#myModal" data-toggle="modal" onclick='getstr(<%=id1%>)'>Update</a>/<a href="/SAMERP/AddClient?delete=<%=id1%>" >Delete</a></td>
					</tr>
					<%
					count++;
						}
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	
				</div>
			</div>
		</div>
	
	
	<!-- Modal -->
<div id="myModal" class="modal hide fade" role="dialog" style="width: 55%; margin-left: -28%;" >
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Update Client Details</h4>
      </div>
      <div class="modal-body">
      <%
      String cid="";
      String coname="";
      String cname="";
      String contactno1="";
      String contactno2="";
      String email="";
      String address="";
      String bamount="";
      System.out.println(request.getParameter("update"));
      if(request.getParameter("update")!=null)
      {
    	  cid=request.getParameter("update");
       	  session.setAttribute("SessionId",cid);
      }
      RequireData rq=new RequireData();
      List list=rd.setClientDetails(cid);
      System.out.println("list li"+list);
      if(list!=null)
      {
    	  Iterator itr=list.iterator();
    	  while(itr.hasNext())
    	  {
    		  
    		  coname=itr.next().toString();
    		  cname=itr.next().toString();
    		  contactno1=itr.next().toString();
    		  contactno2=itr.next().toString();
    		  email=itr.next().toString();
    		  address=itr.next().toString();
    		  bamount=itr.next().toString();
    	  }
      }
      
      %>
     					<form action='/SAMERP/AddClient?update=<%=cid%>' name="form2" method="Post"
								class="form-horizontal" >
								<div class="control-group">
									<label class="control-label">Client Orgnization Name:</label>
									<div class="controls">
										<input type="text" name="coname" id="coname" class="span4"
											placeholder="Client Orgnization Name"  value="<%=coname%>" required />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Client Name:</label>
									<div class="controls">
										<input type="text" name="cname" id="cname"  class="span4"
											placeholder="Client Name" value="<%=cname%>" required />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Client Contact No1:</label>
									<div class="controls">
										<input type="text" name="contactno1" id="contactno1" class="span4"
											placeholder="Client ContactNo1 " value="<%=contactno1%>" required />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">Client Contact No2:</label>
									<div class="controls">
										<input type="text" name="contactno2" id="contactno2"  class="span4"
											placeholder="Client ContactNo2 " value="<%=contactno2%>" required />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">Client EmailId:</label>
									<div class="controls">
										<input type="email" class="span4" name="email" id="email" 
											placeholder="Enter Client Email Id" value="<%=email%>" required />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Client Address:</label>
									<div class="controls">
										<input type="text" class="span4" name="address" id="address" 
											placeholder="Client Address" value="<%=address %>" required />

									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Client Balance Amount:</label>
									<div class="controls">

										<input type="text" name="bamount" id="bamount" 
											placeholder="Client Balance Amount" class="span4" value='<%=bamount%>'
											required />
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" name="save" class="btn btn-success">Update</button>
									<button type="submit" class="btn btn-danger" data-dismiss="modal">Cancel</button>
								</div>
							</form>
      </div>
      
    </div>

  </div>
  </div>
 <!--  modal end -->


	<!--end-Footer-part-->

	<script src="/SAMERP/config/js/excanvas.min.js"></script>
	<script src="/SAMERP/config/js/jquery.min.js"></script>
	<script src="/SAMERP/config/js/jquery.ui.custom.js"></script>
	<script src="/SAMERP/config/js/bootstrap.min.js"></script>
	<script src="/SAMERP/config/js/jquery.flot.min.js"></script>
	<script src="/SAMERP/config/js/jquery.flot.resize.min.js"></script>
	<script src="/SAMERP/config/js/jquery.peity.min.js"></script>
	<script src="/SAMERP/config/js/fullcalendar.min.js"></script>
	<script src="/SAMERP/config/js/matrix.js"></script>
	<script src="/SAMERP/config/js/matrix.dashboard.js"></script>
	<script src="/SAMERP/config/js/jquery.gritter.min.js"></script>
	<script src="/SAMERP/config//SAMERP/config/js/matrix.interface.js"></script>
	<script src="/SAMERP/config/js/matrix.chat.js"></script>
	<script src="/SAMERP/config/js/jquery.validate.js"></script>
	<script src="/SAMERP/config/js/matrix.form_validation.js"></script>
	<script src="/SAMERP/config/js/jquery.wizard.js"></script>
	<script src="/SAMERP/config/js/jquery.uniform.js"></script>
	<script src="/SAMERP/config/js/select2.min.js"></script>
	<script src="/SAMERP/config/js/matrix.popover.js"></script>
	<script src="/SAMERP/config/js/jquery.dataTables.min.js"></script>
	<script src="/SAMERP/config/js/matrix.tables.js"></script>
</body>
</html>
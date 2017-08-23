<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="utility.RequireData"%>
<%@page import="utility.SysDate"%>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="/SAMERP/config/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/SAMERP/config/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/SAMERP/config/css/colorpicker.css" />
<link rel="stylesheet" href="/SAMERP/config/css/datepicker.css" />
<link rel="stylesheet" href="/SAMERP/config/css/uniform.css" />
<link rel="stylesheet" href="/SAMERP/config/css/select2.css" />
<link rel="stylesheet" href="/SAMERP/config/css/matrix-style.css" />
<link rel="stylesheet" href="/SAMERP/config/css/matrix-media.css" />
<link rel="stylesheet" href="/SAMERP/config/css/bootstrap-wysihtml5.css" />
<link href="/SAMERP/config/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>

<style type="text/css">	
	#s2id_autogen1{
	float: right;	
	}
</style>
</head>
<body>

	<!--Header-part-->
	<div id="header">
		<h1>
			<a href="dashboard.html">Matrix Admin</a>
		</h1>
	</div>

	<!--start-top-serch-->
	<div id="search">

		<button type="submit" class="tip-bottom">LOGOUT</button>
	</div>
	<!--close-top-serch-->
	<!--sidebar-menu-->
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Dashboard</a>
		<ul>
			<li class="active"><a href="/SAMERP/index.jsp"><i
					class="icon icon-home"></i> <span>Dashboard</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Settings</span> <span class="label label-important">7</span></a>
				<ul>
					<li><a
						href="/SAMERP/jsp/admin/settings/addMaterialSuppliers.jsp">Add
							Material Supplier</a></li>
					<li><a href="/SAMERP/jsp/admin/settings/addEmployee.jsp">Add
							Employee</a></li>
					<li><a href="/SAMERP/jsp/admin/settings/addOrganization.jsp">Add
							Organization</a></li>
					<li><a href="/SAMERP/jsp/admin/settings/addAccountDetails.jsp">Add
							Account Details</a></li>
					<li><a href="/SAMERP/jsp/admin/settings/addVehicles.jsp">Add
							Vehicles</a></li>
					<li><a href="/SAMERP/jsp/admin/settings/addClient.jsp">Add
							Clients</a></li>
				</ul>
			<li><a href="/SAMERP/jsp/admin/settings/expenses.jsp"><i
					class="icon icon-money"></i> <span>Expenses</span></a></li>
			<li><a href="/SAMERP/jsp/admin/jcb-poc work/jcb-pocDetails.jsp"><i
					class="icon icon-inbox"></i> <span>JCB/POC Detail</span></a></li>
			<li><a href="tables.html"><i class="icon icon-th"></i> <span>Tables</span></a></li>
			<li><a href="grid.html"><i class="icon icon-fullscreen"></i>
					<span>Full width</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Forms</span> <span class="label label-important">3</span></a>
				<ul>
					<li><a href="form-common.html">Basic Form</a></li>
					<li><a href="form-validation.html">Form with Validation</a></li>
					<li><a href="form-wizard.html">Form with Wizard</a></li>
				</ul></li>
			<li><a href="buttons.html"><i class="icon icon-tint"></i> <span>Buttons
						&amp; icons</span></a></li>
			<li><a href="interface.html"><i class="icon icon-pencil"></i>
					<span>Eelements</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-file"></i>
					<span>Addons</span> <span class="label label-important">5</span></a>
				<ul>
					<li><a href="index2.html">Dashboard2</a></li>
					<li><a href="gallery.html">Gallery</a></li>
					<li><a href="calendar.html">Calendar</a></li>
					<li><a href="invoice.html">Invoice</a></li>
					<li><a href="chat.html">vijay option</a></li>
					<li><a href="chat.html">ranka option</a></li>
					<li><a href="chat.html">OM option</a></li>
				</ul></li>
		</ul>
	</div>
	<!--sidebar-menu-->
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="index.html" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a> <a href="#" class="current">JCB/POC
					Detail</a>
			</div>
			<h1>JCB/POC Detail</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="alert alert-info" style="padding-left: 200px;">
							<strong>Enter Party/Customer Name : </strong><input
								list="browsers" name="browser" id="editdata"
								onkeyup="CustomerSearch(this.value)" onkeydown="CustomerPrint()"
								autocomplete="off" required>
							<datalist id="browsers">
							</datalist>
							<button type="button" class="btn btn-primary btn-mini"
								style="width: 40px; border: 2px black solid; font-size: 20px;">+</button>

						</div>
						<div class="widget-content nopadding">
						<form action="/SAMERP/JcbPocDetails.do" method="POST">
							<table class=""
								style="border-color: white; margin: 0 auto; width: 700px">
								<tr>
									<td colspan="2"><h4>Customer Detail</h4></td>
								</tr>
								<tr>
									<td style="text-align: right;">Customer Name : <input
										type="text" name="custname" id="custname" readonly="readonly"></td>
									<td style="text-align: right;">Address : <input
										type="text" name="address" id="address" readonly="readonly"></td>
								</tr>
								<tr>
									<td style="text-align: right;">Contact NO : <input
										type="text" name="contactno" id="contactno"
										readonly="readonly"></td>
									<td style="text-align: right;">Machine Rate :<input type="text" name="vehiclerate" id="vehiclerate" readonly="readonly">              
									
									<input type="hidden" name="custid" id="custid">
									</td>
								</tr>
								<tr>
									<td style="height: 2px;"></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2"><h4>Work Detail</h4></td>
								</tr>
								<tr>
									<td style="text-align: right;">Chalan NO : <input
										type="text" name="chalanno" required="required"></td>
										<% SysDate sd=new SysDate(); %>
									<td style="text-align: right;">Date :<input type="text" name="chalandate" data-date-format="dd-mm-yyyy"
										value="<%=sd.todayDate() %>" class="datepicker"> 

									</td>
								</tr>
								<% 
									RequireData rd= new RequireData();
									List Vehicle=rd.getVehicleList();
									Iterator itr = Vehicle.iterator();
								%>
								<tr>
									<td style="    padding-left: 60px;">Machine Name :<select name="vehicle" class="span8" style="float: right;">
					                  <option></option>
											<%while (itr.hasNext()) {%>
											<option value="<%=itr.next()%>"><%=itr.next()%></option>
											<%}%>
									</select>
              
									</td>
									<td style="text-align: right;">Work Hrs : <input
										type="text" name="workhrs" placeholder="HH:MM" required="required"></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;"><button
											type="submit" name="insertorganizer" class="btn btn-success"">Submit</button>
										<a href="/SAMERP/index.jsp"><button type="button"
												class="btn btn-danger ">Exit</button></a></td>
								</tr>
							</table>
							</form>
						</div>
					</div>
				</div>
			</div>


			<div class="row-fluid">
				<div class="span12">

					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<h5>Data table</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th></th>
										<th>Customer Name</th>
										<th>Chalan no</th>
										<th>Machine Name</th>
										<th>Date</th>
										<th>Work Hrs</th>
										<th>Action</th>
									</tr>
								</thead>
								<%
									List details = rd.getJcbPocWorkDetail();
									int srno = 0;
									String custname = "";
									String chalanno = "";
									String vehiclename = "";
									String date = "";
									String workhr="";
									String jcbpocid="";
									
									if (details != null) {
										System.out.println("in Print Invoice.jsp" + details);

										Iterator itr2 = details.iterator();
								%>
								<tbody>
									<%
										while (itr2.hasNext()) {
												srno++;
												custname = itr2.next().toString();
												chalanno = itr2.next().toString();
												vehiclename = itr2.next().toString();
												date = itr2.next().toString();
												workhr = itr2.next().toString();
												jcbpocid =itr2.next().toString();
									%>
									<tr class="gradeX">
										<td><%=srno%></td>
										<td><%=custname%></td>
										<td><%=chalanno%></td>
										<td><%=vehiclename%></td>
										<td><%=date%></td>
										<td><%=workhr %></td>
										<td><a href="#update" data-toggle='modal'
											onclick='getSr(<%=jcbpocid%>)'>Update</a> / <a
											href="/SAMERP/AddCustomer.do?deleteid=<%=jcbpocid%>">Delete</a></td>
									</tr>
									<%
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
	<!--Footer-part-->
	<div class="row-fluid">
		<div id="footer" class="span12">
			2013 &copy; Matrix Admin. Brought to you by <a
				href="http://themedesigner.in">Themedesigner.in</a>
		</div>
	</div>
	<!--end-Footer-part-->
	<script type="text/javascript">
		//**********************Customer Search******************************************
		
		
		function CustomerSearch(str) {

			var xhttp;
			if (str == "") {
				return;
			}
			xhttp = new XMLHttpRequest();

			try {
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						//document.getElementById("imeino").innerHTML = this.responseText;
						var demoStr = this.responseText.split(",");
						var text = "";
						var i = 0
						for (; demoStr[i];) {
							text += "<option id="+demoStr[i];
					i++;
					text += " value="+demoStr[i]+">"
									+ demoStr[i] + "</option>";
							i++;
						}
						document.getElementById("browsers").innerHTML = text;
					}

				};

				xhttp.open("POST", "/SAMERP/JcbPocDetails.do?q=" + str, true);
				xhttp.send();
			} catch (e) {
				alert("Unable to connect to server");
			}
		}
		//********************************END Search***********************************
		//********************************Print Customer Data**************************
		function  CustomerPrint() {
			var val = document.getElementById('editdata').value;
		      var str = $('#browsers').find('option[value="' + val + '"]').attr('id');
		      //alert(str);
		      var xhttp;
				if (str == "") {
					return;
				}
				if(event.keyCode == 13) {
					xhttp = new XMLHttpRequest();
					try{ 
					xhttp.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							var demoStr = this.responseText.split("~");
							
			 				document.getElementById("custid").value = demoStr[0];
			 				document.getElementById("custname").value = demoStr[1];
			 				document.getElementById("address").value = demoStr[2];
			 				document.getElementById("contactno").value = demoStr[3];
			 				document.getElementById("vehiclerate").value =demoStr[4];
						}

					};
					
					xhttp.open("POST", "/SAMERP/JcbPocDetails.do?CustomerPrint=" + str, true);
					xhttp.send();
					}
					catch(e)
					{
						alert("Unable to connect to server");
					}     
			    }
		}
		//******************************************END Cutomer Print******************************************************************
	</script>

	<script src="/SAMERP/config/js/jquery.min.js"></script>
	<script src="/SAMERP/config/js/jquery.ui.custom.js"></script>
	<script src="/SAMERP/config/js/bootstrap.min.js"></script>
	<script src="/SAMERP/config/js/bootstrap-colorpicker.js"></script>
	<script src="/SAMERP/config/js/bootstrap-datepicker.js"></script>
	<script src="/SAMERP/config/js/jquery.toggle.buttons.js"></script>
	<script src="/SAMERP/config/js/masked.js"></script>
	<script src="/SAMERP/config/js/jquery.uniform.js"></script>
	<script src="/SAMERP/config/js/select2.min.js"></script>
	<script src="/SAMERP/config/js/matrix.js"></script>
	<script src="/SAMERP/config/js/matrix.form_common.js"></script>
	<script src="/SAMERP/config/js/wysihtml5-0.3.0.js"></script>
	<script src="/SAMERP/config/js/jquery.peity.min.js"></script>
	<script src="/SAMERP/config/js/bootstrap-wysihtml5.js"></script>
	<script>
	$('.textarea_editor').wysihtml5();
</script>



</body>
</html>

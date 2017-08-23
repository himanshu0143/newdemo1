
<%@page import="dao.General.GenericDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="utility.SysDate"%>
<%@page import="utility.RequireData"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vertical Software</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- <link rel="stylesheet" href="/MSaleERP/config/css/bootstrap.min.css" /> -->
<!-- <link rel="stylesheet" href="/MSaleERP/config/css/bootstrap-responsive.min.css" /> -->
<!-- <link rel="stylesheet" href="/MSaleERP/config/css/fullcalendar.css" /> -->
<!-- <link rel="stylesheet" href="/MSaleERP/config/css/matrix-style.css" /> -->
<!-- <link rel="stylesheet" href="/MSaleERP/config/css/matrix-media.css" /> -->
<!-- <link href="config/font-awesome/css/font-awesome.css" rel="stylesheet" /> -->
<!-- <link rel="stylesheet" href="/MSaleERP/css/jquery.gritter.css" /> -->
<!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'> -->
</head>



<body onload="showModal()">

<!--Header-part-->

<!--close-Header-part--> 


<!--top-Header-menu-->

<!--close-top-Header-menu-->
<!--start-top-serch-->

<!--close-top-serch-->
<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="fa fa-home"></i> Dashboard</a>
  <ul>
    <li><a href="/SAMERP/index.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a> </li>
    <li class="submenu"> <a href="#"><i class="fa fa-th-list"></i> <span>Settings</span> <span class="label label-important">7</span></a>
      <ul>
      	<li><a href="/SAMERP/jsp/admin/settings/addVehicles.jsp">Add Vehicles</a></li>
        <li><a href="/SAMERP/jsp/admin/settings/addAccountDetails.jsp">Add Bank Account</a></li>
        <li><a href="/SAMERP/jsp/admin/settings/addEmployee.jsp">Add Employee</a></li>
        <li><a href="/SAMERP/jsp/admin/settings/addMaterialSuppliers.jsp">Add Material Supplier</a></li>
        <li><a href="/SAMERP/jsp/admin/settings/addClient.jsp">Add Client (Pipe)</a></li>    
        <li><a href="/SAMERP/jsp/admin/settings/addCustomer.jsp">Add Customer (JCB/POC)</a></li>    
        <li><a href="/SAMERP/jsp/admin/settings/addOrganization.jsp">Add Organization</a></li>

      </ul>
    </li>
    <li><a href="/SAMERP/jsp/admin/jcb-poc work/jcb-pocDetails.jsp"><i class="fa fa-inbox"></i> <span>Jcb/Poc Work</span></a> </li>
    <li><a href="widgets.html"><i class="fa fa-inbox"></i> <span>Sale</span></a> </li>
    <li><a href="/SAMERP/jsp/admin/purchase/purchaseRawMaterial.jsp"><i class="fa fa-th"></i> <span>Purchase</span></a></li>
    <li><a href="/SAMERP/jsp/admin/settings/expenses.jsp"><i class="fa fa-money"></i> <span>Expenses</span></a> </li>
    <li><a href="grid.html"><i class="fa fa-fullscreen"></i> <span>Work Details</span></a></li>
    <li><a href="interface.html"><i class="fa fa-pencil"></i> <span>Report</span></a></li>
  </ul>
</div>
<!--sidebar-menu-->


<div class="modal hide fade" id="saleReport" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<h4 class="modal-title">Sales Report</h4>
			</div>
			<% SysDate sd= new SysDate();
                  String date =	sd.todayDate();
                %>
			<div class="modal-body">
				<form class="form-horizontal" action="/MSaleERP/Report.do" method="post" name="salereport">
					<div class="form-group">
						<label class="control-label">To &nbsp;</label>
						<div class='controls' style="margin: 0 auto;">
							<input type="date" name="toDate" id ="purchasedateid" required />				
						</div>
						<label class="control-label">From &nbsp;</label>
						<div class='controls' style="margin: 0 auto;">
							<input type="date" name="fromDate" id ="purchasedateid" value="<%=date%>" />				
						</div>
					
					</div>
					<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="Generate"  />
					<input type="button" class="btn btn-primary" data-dismiss="modal" on value="Cancel"/>
					</div>
					
			</form>
			</div>
				
			</div>
		</div>
	</div>

<div class="modal hide fade" id="purchaseReport" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<h4 class="modal-title">Purchase Report</h4>
			</div>
			<% SysDate sysd= new SysDate();
                  String date1 =	sysd.todayDate();
                %>
			<div class="modal-body">
				<form class="form-horizontal" action="/MSaleERP/PurchaseReport.do" method="post" name="purchaseReport">
					<div class="form-group">
						<label class="control-label">To &nbsp;</label>
						<div class='controls' style="margin: 0 auto;">
							<input type="date" name="toDate" id ="purchasedateid" required />				
						</div>
						<label class="control-label">From &nbsp;</label>
						<div class='controls' style="margin: 0 auto;">
							<input type="date" name="fromDate" id ="purchasedateid" value="<%=date1%>" />				
						</div>
					
					</div>
					<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="Generate" />
					<input type="button" class="btn btn-primary" data-dismiss="modal" on value="Cancel"/>
					</div>
					
			</form>
			</div>
				
			</div>
		</div>
	</div>


<script type="text/javascript">

</script>

<!--end-Footer-part-->

<!-- <script src="/MSaleERP/config/js/excanvas.min.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/jquery.min.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/jquery.ui.custom.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/bootstrap.min.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/jquery.flot.min.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/jquery.flot.resize.min.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/jquery.peity.min.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/fullcalendar.min.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/matrix.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/matrix.dashboard.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/jquery.gritter.min.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/matrix.interface.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/matrix.chat.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/jquery.validate.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/matrix.form_validation.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/jquery.wizard.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/jquery.uniform.js"></script>  -->
<script src="/MSaleERP/config/js/select2.min.js"></script> 
<!-- <script src="/MSaleERP/config/js/matrix.popover.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/jquery.dataTables.min.js"></script>  -->
<!-- <script src="/MSaleERP/config/js/matrix.tables.js"></script>  -->


</html>
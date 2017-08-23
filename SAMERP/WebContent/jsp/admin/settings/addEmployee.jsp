<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="utility.RequireData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>SAMERP PROJECT</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/SAMERP/config/css/bootstrap.min.css" />
<link rel="stylesheet" href="/SAMERP/config/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/SAMERP/config/css/fullcalendar.css" />
<link rel="stylesheet" href="/SAMERP/config/css/matrix-style.css" />
<link rel="stylesheet" href="/SAMERP/config/css/matrix-media.css" />
<link href="/SAMERP/config/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="/SAMERP/config/css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<style>
#snackbar {
    visibility: hidden;
    min-width: 250px;
    margin-left: -125px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 15px;
    border-radius:50px 50px;
}

#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}
</style>
<body onload="setFocusToTextBox()">

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Matrix Admin</a></h1>
</div>


<!--start-top-serch-->
<div id="search">
<% if(request.getAttribute("status")!=null){ %>
<div id="snackbar"><%=request.getAttribute("status")%></div>
<%} %>

  <button type="submit" class="tip-bottom">LOGOUT</button>
</div>
<!--close-top-serch-->
<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
    <li><a href="index.html"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
    <li class="submenu active open"> <a href="#"><i class="icon icon-th-list"></i> <span>Settings</span> <span class="label label-important">7</span></a>
      <ul>
        <li><a href="/SAMERP/jsp/admin/settings/addMaterialSuppliers.jsp">Add Material Supplier</a></li>
        <li class="active"><a href="/SAMERP/jsp/admin/settings/addEmployee.jsp">Add Employee</a></li>
        <li><a href="/SAMERP/jsp/admin/settings/addOrganization.jsp">Add Organization</a></li>
      </ul>
    </li>
    <li> <a href="/SAMERP/jsp/admin/settings/expenses.jsp"><i class="icon icon-money"></i> <span>Expenses</span></a> </li>
    <li> <a href="widgets.html"><i class="icon icon-inbox"></i> <span>Widgets</span></a> </li>
    <li><a href="tables.html"><i class="icon icon-th"></i> <span>Tables</span></a></li>
    <li><a href="grid.html"><i class="icon icon-fullscreen"></i> <span>Full width</span></a></li>
    <li><a href="buttons.html"><i class="icon icon-tint"></i> <span>Buttons &amp; icons</span></a></li>
    <li><a href="interface.html"><i class="icon icon-pencil"></i> <span>Eelements</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-file"></i> <span>Addons</span> <span class="label label-important">5</span></a>
      <ul>
        <li><a href="index2.html">Dashboard2</a></li>
        <li><a href="gallery.html">Gallery</a></li>
        <li><a href="calendar.html">Calendar</a></li>
        <li><a href="invoice.html">Invoice</a></li>
        <li><a href="chat.html">Chat option</a></li>
      </ul>
    </li>

  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" class="tip-bottom" data-original-title="Go to Home"><i class="icon-home">
    </i> Home</a> <a href="#" class="current">Add Employee</a> </div>
  </div>
<!--End-breadcrumbs-->
<div class="container-fluid">
  <hr>
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>Add Employee</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="/SAMERP/AddEmployee" method="post" class="form-horizontal">
            <div class="control-group">
              <label class="control-label"> Employee Name :</label>
              <div class="controls">
                <input type="text" name="employeename" id="employeename" class="span5" placeholder="Employee Name" onkeyup="this.value=this.value.toUpperCase()" required/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Contact No. :</label>
              <div class="controls">
                <input type="text" name="contactno" class="span5" placeholder="Contact Number" onkeypress="return isNumber(event)" maxlength="10" required/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Employee Type :</label>
              <div class="controls">
                <input type="text" name="employetype" class="span5" placeholder="Employee Type" onkeyup="this.value=this.value.toUpperCase()" required/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Employee Address : </label>
              <div class="controls">
                <input type="text" name="address" class="span5" placeholder="Employee Address" onkeyup="this.value=this.value.toUpperCase()" />
              </div>
            </div>

            <div class="form-actions" >
            <button type="submit" name="insertemployee" class="btn btn-success"         style="position:relative; right:700px; float:right;">Submit</button>
              <a href="/SAMERP/index.jsp"><button type="button" class="btn btn-danger " style="position:relative; right:550px;   float:right;">Exit</button></a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  
 
  		<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>Employee Details</h5>
            <span class="label label-important" name="dealerCount" id="dealerCount" style="height: 15px; width: 15px;"><p>	</p></span>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>S.No.</th>
                  <th>Employee Name</th>
                  <th>Contact No</th>
                  <th>Employee Type</th>
                  <th>Address</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
              <%RequireData rd=new RequireData();
              	List getMSPData=rd.getEmployeeData();
              	if(getMSPData!=null){
              	Iterator itr=getMSPData.iterator();
              	int i=1;
              	while(itr.hasNext()){ Object empId=itr.next();
              	%>
                <tr>
                  <td style="text-align: center"><%=i %><% i++; %></td>
                  <td style="text-align: center" value="<%=empId%>"><%=itr.next() %></td>
                  <td style="text-align: center"><%=itr.next() %></td>
                  <td style="text-align: center"><%=itr.next() %></td>
                  <td style="text-align: center"><%=itr.next() %></td>
                  <td style="text-align: center"><a href="#">Update</a>|<a href="/SAMERP/AddEmployee?deleteId=<%=empId%>">Delete</a></td>
                </tr>
                <%itr.next();}} %>
              </tbody>
            </table>
          </div>
        </div>
  	</div>

</div>

<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in">Themedesigner.in</a> </div>
</div>

<!--end-Footer-part-->

<script>
function myFunction() {
    var x = document.getElementById("snackbar")
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && ( charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function setFocusToTextBox() {
	document.getElementById("employeename").focus();
	myFunction();
}
</script>
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

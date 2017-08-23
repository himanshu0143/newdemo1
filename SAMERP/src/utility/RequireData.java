package utility;

import java.util.List;

import dao.General.GenericDAO;

public class RequireData 
{
	GenericDAO gd=new GenericDAO();
	
	//starts your methods here

	
	// himanshu start
	public List getCustomerList() {
		String Customer_query="SELECT * FROM `customer_master`";
		List CustomerList=gd.getData(Customer_query);
		return CustomerList;
	}
	
	public List getVehicleList() {
		String Vehicle_query="SELECT `vehicle_id`,`vehicle_aliasname` FROM `vehicle_details`";
		List VehicleList=gd.getData(Vehicle_query);
		return VehicleList;
	}
	public List getJcbPocWorkDetail() {
		String JcbPocWorkDetail_query="SELECT customer_master.`custname`,jcbpoc_master.`chalanno`,vehicle_details.vehicle_aliasname,jcbpoc_master.`data`,jcbpoc_master.`workhr`,jcbpoc_master.intjcbpocid FROM `jcbpoc_master`,customer_master,vehicle_details WHERE jcbpoc_master.intcustid=customer_master.intcustid AND jcbpoc_master.intvehicleid=vehicle_details.vehicle_id ORDER BY jcbpoc_master.intjcbpocid DESC";
		List JcbPocWorkList=gd.getData(JcbPocWorkDetail_query);
		return JcbPocWorkList;
	}
		//--himanshu end
	
	// mukesh start
	
		public List getVehiclesData()
		{
			String vehicleDetailsQuery = "select vehicle_id, vehicle_type, vehicle_number, vehicle_rate from vehicle_details order by vehicle_id desc;";
			List vehicleDetailsData = gd.getData(vehicleDetailsQuery);
			return vehicleDetailsData;
		}
		
		public List getVehicleRowData(String RowId)
		{
			String vehicleRowDataQuery = "select vehicle_id, vehicle_type, vehicle_number, vehicle_rate from vehicle_details where vehicle_id="+RowId+"; ";
			List vehicleDetailsData = gd.getData(vehicleRowDataQuery);
			System.out.println(vehicleDetailsData);
			return vehicleDetailsData;
		}
		
		
	//--mukesh end
	
	// omkar start
	
	public List getAccountDetails()
	{
		String demo="select * from account_details";
		List demoList=gd.getData(demo);
		return demoList;
	}
	
	public List getAccountRowData(String id)
	{
		String demo="select * from account_details where acc_id="+id+"";
		List demoList=gd.getData(demo);
		return demoList;
	}
	
	//--omkar end
	
	// sandeep start
	public List getClientDetails()
	{
		String query="select `client_id`,`client_orgnization_name`,`client_name`,`client_contactno1`,`client_contactno2`,`client_email`,`client_address`,`client_balance_amount` from `client_details`";
		System.out.println("query is:"+query);
		List list=gd.getData(query);
		return list;		
	}
	
	public List setClientDetails(String cid)
	{
		String id=cid;
		String query="select `client_orgnization_name`,`client_name`,`client_contactno1`,`client_contactno2`,`client_email`,`client_address`,`client_balance_amount` from `client_details`";
		List list=gd.getData(query);
		return list;
		
	}
	
		//--sandeep end
	
	
	
	// sarang start
	
	public List getEmployeeData()
	{
		String demo="select * from emplyoee_details";
		List demoList=gd.getData(demo);
		return demoList;
	}
	
	public List getRowCount(String table_name)
	{
		String rowCountQuery = "select count(*) from "+table_name+";";
		List rowCount = gd.getData(rowCountQuery);
		return rowCount;
	}
	
	public List getEmployeeRowData(String RowId)
	{
		String employeeRowDataQuery = "select emp_id, emp_name, emp_contactno, emp_type, emp_address from emplyoee_details where emp_id="+RowId+"; ";
		List employeeDetailsData = gd.getData(employeeRowDataQuery);
		System.out.println(employeeDetailsData);
		return employeeDetailsData;
	}
	
	public List getOrganizationData()
	{
		String demo="select organization_id, organization_name, organization_contactno1, organization_contactno2, organization_address, organization_email from organization_details";
		List demoList=gd.getData(demo);
		return demoList;
	}
	
	public List getOrganizationRowData(String RowId)
	{
		String organizationRowDataQuery = "select organization_id, organization_name, organization_address, organization_contactno1, organization_contactno2, organization_email from organization_details where organization_id="+RowId+"; ";
		List organizationDetailsData = gd.getData(organizationRowDataQuery);
		System.out.println(organizationDetailsData);
		return organizationDetailsData;
	}
		
	
	//--sarang end
	
	// vijay start
	
	public List getMaterialSupplyData()
	{
		String demo="select * from material_supply_master";
		List demoList=gd.getData(demo);
		return demoList;
	}
	public List getBankAliasName()
	{
		String demo="SELECT account_details.acc_aliasname FROM account_details";
		List demoList=gd.getData(demo);
		return demoList;
	}
	public List getExpensesDetails()
	{
		String demo="SELECT `exp_id`,`expenses_type`.`expenses_type_name`, `name`, `amount`, "
				+ "`payment_mode`, `date`, `reason`, `other_details` FROM `expenses_master`,"
				+ "`expenses_type` WHERE expenses_type.expenses_type_id=expenses_master.expenses_type_id";
		List demoList=gd.getData(demo);
		return demoList;
	}
	public List getExpensesType()
	{
		String demo="select expenses_type_id, expenses_type_name from expenses_type where status=0";
		List demoList=gd.getData(demo);
		return demoList;
	}
	
	
		//--vijay end
	
}

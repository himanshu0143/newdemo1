package admin.settings;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.General.GenericDAO;
import utility.RequireData;


public class AddVehicles extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		GenericDAO gd = new GenericDAO();
		
		if(request.getParameter("insertSubmitBtn")!=null)
		{
			
			String vehicleType = request.getParameter("vehicle_type");	
			System.out.println(vehicleType);
			
			String vehicleNo1 = request.getParameter("vehicleno1");
			String vehicleNo2 = request.getParameter("vehicleno2");
			String vehicleNo3 = request.getParameter("vehicleno3");
			String vehicleNo4 = request.getParameter("vehicleno4");
			String vehicleRate = request.getParameter("rateText");
			
			String vehicleNo = vehicleNo1+"-"+vehicleNo2+"-"+vehicleNo3+"-"+vehicleNo4;
			String vehicleAlias = vehicleType +"_"+vehicleNo1+"-"+vehicleNo2+"-"+vehicleNo3+"-"+vehicleNo4;
			System.out.println(vehicleAlias);
			
			String insertVehicleQuery = "insert into vehicle_details(vehicle_type, vehicle_number, vehicle_rate, vehicle_aliasname) values ('"+vehicleType+"', '"+vehicleNo+"', '"+vehicleRate+"', '"+vehicleAlias+"');";
			int insertStatus = gd.executeCommand(insertVehicleQuery);
			
			if(insertStatus==1){
				System.out.println("insert successful");
				String updateVehicleQuery = "update vehicle_details set vehicle_rate="+vehicleRate+" where vehicle_type='"+vehicleType+"';";
				int updatestatus = gd.executeCommand(updateVehicleQuery);
				request.setAttribute("status", "Vehicle Inserted Successfully");
			}else{
				System.out.println("insert fail");
				request.setAttribute("status", "Vehicle Insert Fail");
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("jsp/admin/settings/addVehicles.jsp");
			rd.forward(request, response);
		}
		
		if(request.getParameter("deleteid")!=null)
		{
			String deleteId = request.getParameter("deleteid");	
			String deleteVehicleQuery= "delete from vehicle_details where vehicle_id="+deleteId;
			int deletestatus = gd.executeCommand(deleteVehicleQuery);
			
			if(deletestatus==1){
				System.out.println("delete vehicle successful");
				request.setAttribute("status", "Vehicle Deleted Successfully");
			}else{
				System.out.println("delete vehicle fail");
				request.setAttribute("status", "Vehicle Delete Fail");
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("jsp/admin/settings/addVehicles.jsp");
			rd.forward(request, response);
		}
		
		
		if(request.getParameter("updateid")!=null)
		{
			String RowId=request.getParameter("updateid");
			RequireData rd=new RequireData();
			List demoList=rd.getVehicleRowData(RowId);
			Iterator itr=demoList.iterator();
			while(itr.hasNext())
			{
				out.print(itr.next()+",");
			}
	
		}
		
		if(request.getParameter("updateSubmitBtn")!=null)
		{
			
			String oldVehicleType = request.getParameter("oldvehicle_type");
			String vehicleId = request.getParameter("Updatevehicle_id");
			String vehicleType = request.getParameter("Updatevehicle_type");
			String oldRate = request.getParameter("oldRate");
			String UpdatedRate = request.getParameter("UpdaterateText");
			
			String Updatevehicleno1 = request.getParameter("Updatevehicleno1");
			String Updatevehicleno2 = request.getParameter("Updatevehicleno2");
			String Updatevehicleno3 = request.getParameter("Updatevehicleno3");
			String Updatevehicleno4 = request.getParameter("Updatevehicleno4");
			
			String vehicleNum = Updatevehicleno1+"-"+Updatevehicleno2+"-"+Updatevehicleno3+"-"+Updatevehicleno4;
			
			String updateVehicleQuery1 = "update vehicle_details set vehicle_number='"+vehicleNum+"', vehicle_type='"+vehicleType+"'  where vehicle_id='"+vehicleId+"';";
			int updatestatus1 = gd.executeCommand(updateVehicleQuery1);
			
			if(updatestatus1>=1){
				
				if(!(oldRate.equals(UpdatedRate)) || !(oldVehicleType.equals(vehicleType)) ){
					
					String updateVehicleQuery = "update vehicle_details set vehicle_rate="+UpdatedRate+" where vehicle_type='"+vehicleType+"';";
					int updatestatus = gd.executeCommand(updateVehicleQuery);
					
					if(updatestatus>=1){
						System.out.println("update vehicle successful");
						request.setAttribute("status", "Vehicle Updated Successfully");
					}
				}
				request.setAttribute("status", "Vehicle Updated Successfully");
				
			}else{
				
				System.out.println("update vehicle fail");
				request.setAttribute("status", "Vehicle Update Fail");
			}
			
			
			RequestDispatcher rd = request.getRequestDispatcher("jsp/admin/settings/addVehicles.jsp");
			rd.forward(request, response);
			
		}
		
	}

}

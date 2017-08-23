package admin.expenses;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.General.GenericDAO;

public class Expenses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Expenses() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		if(request.getParameter("addNewExpType")!=null)
		{
			GenericDAO gd=new GenericDAO();
			String name=request.getParameter("addNewExpType");
			int getstatus=0;
			String query="INSERT INTO `expenses_type`(`expenses_type_name`) VALUES ('"+name+"')";
			getstatus=gd.executeCommand(query);
			if(getstatus!=0)
			{
				out.print("1,"+name+" Added Successfully");
			}
			
		}
		if(request.getParameter("insertName")!=null)
				{
					GenericDAO gd=new GenericDAO();
					String insertData=request.getParameter("insertName");
					String querycheck="SELECT `expenses_type_name` FROM `expenses_type` where status=0";
					//check if present
					List checkerlist=gd.getData(querycheck);
					Iterator getitr=checkerlist.iterator();
					boolean status=false;
					while(getitr.hasNext())
					{
						if(insertData.equals(getitr.next().toString()))
						{
							status=true;
						}
							
					}
					if(status)
					{
						out.println("1,");
					}
					else
					{
						out.println("0,"+insertData);
					}
				}
			
		//for finding expense type and fetch list
		if(request.getParameter("findExpType")!=null)
		{
			GenericDAO da = new GenericDAO();
			String columnName=request.getParameter("id");
			String name=request.getParameter("findExpType");
			List details = null;
			String query = "SELECT expenses_type."+columnName+" FROM expenses_type WHERE "+columnName+" LIKE '"+name+"%' group by "+columnName+"";
			details = da.getData(query);
			if(!details.isEmpty())
			{
				Iterator itr = details.iterator();
				while (itr.hasNext()) {
					out.print("<option>"+itr.next()+"</option>");
	
					}
			}
		}
		
		//for finding name and fetch list
		
		if(request.getParameter("findName")!=null)
		{
			GenericDAO da = new GenericDAO();
			String columnName=request.getParameter("id");
			String name=request.getParameter("findName");
			List details = null;
			String query = "SELECT expenses_master."+columnName+" FROM expenses_master WHERE "+columnName+" LIKE '"+name+"%' group by "+columnName+"";
			details = da.getData(query);
			if(!details.isEmpty())
			{
				Iterator itr = details.iterator();
				while (itr.hasNext()) {
					out.print("<option>"+itr.next()+"</option>");
	
					}
			}
		}
		// insert query
		if(request.getParameter("save")!=null)
		{
			GenericDAO gd=new GenericDAO();
			int getstatus=0;
			String expType=request.getParameter("expType");
			String name=request.getParameter("name");
			double amount=Double.parseDouble(request.getParameter("amount").toString());
			String type=request.getParameter("type");
			String date=request.getParameter("date");
			String[] arrayOfString = date.split("-");
			String details=request.getParameter("reason");
			String other_details=request.getParameter("other_details");
			//fetching the query
			String getExpIdQuery="select expenses_type_id from expenses_type where expenses_type_name='"+expType+"'";
			List expId=gd.getData(getExpIdQuery);
			Iterator expiditr=expId.iterator();
			String getExpId="";
			while(expiditr.hasNext())
			{
				getExpId=expiditr.next().toString();
			}
				String query="INSERT INTO `expenses_master`(`expenses_type_id`,`name`, `amount`, `payment_mode`, `date`, `reason`, `other_details`) "
						+ "VALUES ("+getExpId+",'"+name+"',"+amount+",'"+type+"','"+arrayOfString[2]+"-"+arrayOfString[1]+"-"+arrayOfString[0]+"','"+details+"','"+other_details+"')";
				getstatus=gd.executeCommand(query);
			
			if(getstatus!=0)
			{
				System.out.println("Successfully Inserted In Expenses");
				request.setAttribute("status", "Inserted Successfully");
				RequestDispatcher rd=request.getRequestDispatcher("jsp/admin/settings/expenses.jsp");
				rd.forward(request, response);
			}
		}
		// delete query
		if(request.getParameter("deleteId")!=null)
		{
			GenericDAO gd=new GenericDAO();
			int delstatus=0;
			String deleteQuery="Delete from `expenses_master` where exp_id="+request.getParameter("deleteId");
			delstatus=gd.executeCommand(deleteQuery);
			if(delstatus!=0)
			{
				System.out.println("successfully deleted in expenses");
				request.setAttribute("status", "Deleted Successfully");
				RequestDispatcher rd=request.getRequestDispatcher("jsp/admin/settings/expenses.jsp");
				rd.forward(request, response);
			}
		}

	}

}

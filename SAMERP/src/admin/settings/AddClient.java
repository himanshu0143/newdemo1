package admin.settings;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import dao.General.GenericDAO;




@WebServlet("/AddClient")
public class AddClient extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		GenericDAO gd=new GenericDAO();
		
		if(request.getParameter("insert")!=null)
		{
		String coname=request.getParameter("coname");
		String cname=request.getParameter("cname");
		String contactno1=request.getParameter("contactno1");
		String contactno2=request.getParameter("contactno2");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String cbamount=request.getParameter("bamount");
		
		String query="insert into `client_details` (`client_orgnization_name`,`client_name`,`client_contactno1`,`client_contactno2`,`client_email`,`client_address`,`client_balance_amount`) values('"+coname+"','"+cname+"','"+contactno1+"','"+contactno2+"','"+email+"','"+address+"','"+cbamount+"')";
		System.out.println(query);
		int i=gd.executeCommand(query);
		
		if(i==1)
		{
			System.out.println("inserted successfully");
			RequestDispatcher rd=request.getRequestDispatcher("jsp/admin/settings/addClient.jsp");
			rd.include(request, response);
		}
		else
		{
			System.out.println("please try again");
			RequestDispatcher rd=request.getRequestDispatcher("jsp/admin/settings/addClient.jsp");
			rd.include(request, response);
		}
		}
		
		if(request.getParameter("delete")!=null)
		{
			String delete="delete from `client_details` where `client_id`="+request.getParameter("delete")+"";
			System.out.println("Delete Query:"+delete);
			int data=gd.executeCommand(delete);
			if(data==1)
			{
				System.out.println("Deleted Successfully");
				RequestDispatcher rd=request.getRequestDispatcher("jsp/admin/settings/addClient.jsp");
				rd.include(request, response);
			}else
			{
				System.out.println("Please try again");
				RequestDispatcher rd=request.getRequestDispatcher("jsp/admin/settings/addClient.jsp");
				rd.include(request, response);
			}
		}
		
		if(request.getParameter("save")!=null)
		{
			
						
			String coname=request.getParameter("coname");
			String cname=request.getParameter("cname");
			String contactno1=request.getParameter("contactno1");
			String contactno2=request.getParameter("contactno2");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			int cbamount=Integer.parseInt(request.getParameter("bamount"));
			
			String query="update `client_details` set `client_orgnization_name`='"+coname+"',`client_name`='"+cname+"',`client_contactno1`='"+contactno1+"',`client_contactno2`='"+contactno2+"',`client_email`='"+email+"',`client_address`='"+address+"',`client_balance_amount`='"+cbamount+"' where `client_id`="+request.getParameter("update")+"";
			
			int i=gd.executeCommand(query);
			
			if(i==1)
			{
				System.out.println("updated Successfully");
				RequestDispatcher rd=request.getRequestDispatcher("jsp/admin/settings/addClient.jsp");
				rd.include(request, response);
			}
			else
			{
				System.out.println("Please try again");
				RequestDispatcher rd=request.getRequestDispatcher("jsp/admin/settings/addClient.jsp");
				rd.include(request, response);
			}
			
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

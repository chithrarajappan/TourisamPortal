<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
session.setAttribute("user",null);
session.invalidate();
response.sendRedirect("index.jsp");
%> 
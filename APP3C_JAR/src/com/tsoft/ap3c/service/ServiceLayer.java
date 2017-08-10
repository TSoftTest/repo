package com.tsoft.ap3c.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class ServiceLayer {
	private static String JDBC_DRIVER;
	private static String DB_URL;
	private static String USER;
	private static String PASS;

	private Connection conn;
	private Statement stmt;

	private static void checkProperties() {
		Properties properties = new Properties();

		synchronized (properties) {
			if (properties.isEmpty()) {
				InputStream is = ServiceLayer.class.getClassLoader().getResourceAsStream("serviceLayer.properties");
				try {
					properties.load(is);

					JDBC_DRIVER = properties.getProperty("JDBC_DRIVER");
					DB_URL = properties.getProperty("DB_URL");
					USER = properties.getProperty("USER");
					PASS = properties.getProperty("PASS");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public ServiceLayer() throws Exception {
		conn = null;
		stmt = null;
		//checkProperties();
	}

	public String getString() throws Exception {
		ResultSet rs = null;

		try {
			String texto = "";
			System.out.print("DB_URL:" + DB_URL + "\n");
			System.out.print("USER:" + USER + "\n");
			System.out.print("PASS:" + PASS + "\n");

			//conn = DriverManager.getConnection(DB_URL, USER, PASS);
			//stmt = conn.createStatement();
			//String sql = "select texto from texto";
			//rs = stmt.executeQuery(sql);
			//rs.next();
			//texto = rs.getString(1);

			return texto + " - Este texto esta en el JAR - Versión 21";

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}
}

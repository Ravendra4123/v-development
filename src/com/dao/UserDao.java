package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.model.Categories;
import com.model.Medical;
import com.model.Person;
import com.model.Post;
import com.model.Query;
import com.model.School;
import com.model.Shop;
import com.model.Temple;
import com.model.Users;

public class UserDao {

	public static Connection getconnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_aksu","root","");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;

	}

	public static int registration(Users u) {
		int status = 0;
		try {
			Connection con = UserDao.getconnection();
			PreparedStatement ps = con
					.prepareStatement("insert into users(name,email,password,date,status) values(?,?,?,now(),'Null')");
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static List<Users> getAllRecords() {
		List<Users> list = new ArrayList<Users>();
		try {
			Connection con = UserDao.getconnection();
			PreparedStatement ps = con.prepareStatement("select * from users");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Users u = new Users();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setDate(rs.getString("date"));
				u.setStatus(rs.getString("status"));
				list.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static Users viewById(int id) {
		Users s = new Users();

		try {
			Connection con = UserDao.getconnection();
			PreparedStatement ps = con.prepareStatement("select * from users where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s.setId(rs.getInt(1));
				s.setName(rs.getString(2));
				s.setStatus(rs.getString(3));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}

	public static int approved(Users u) {
		int status = 0;
		try {
			Connection con = UserDao.getconnection();
			PreparedStatement ps = con.prepareStatement("update users set status='Verified' where id=?");

			ps.setInt(1, u.getId());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;

	}

	public static int reject(int id) {
		int status = 0;
		try {
			Connection con = UserDao.getconnection();
			PreparedStatement ps = con.prepareStatement("delete from users where id=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static Users validate(String email, String password) {
		Users user = null;
		try {
			Connection con = UserDao.getconnection();
			PreparedStatement ps = con
					.prepareStatement("select * from users where email=? and password=? and type='User' and status='Verified'");

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user = new Users();

				// data from db
				String name = rs.getString("name");
				// set to user object
				user.setName(name);

				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}

	SessionFactory factory = new Configuration().configure().buildSessionFactory();

	public void save(School s) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(s);
		tx.commit();
		session.close();
	}

	public List<School> viewallschool() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(School.class);
		List<School> e = cr.list();
		return e;
	}

	public School getSchoolById(int sid) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(School.class);
		cr.add(Restrictions.eq("sid", sid));
		School school = (School) cr.uniqueResult();
		return school;
	}

	public void updateSchool(School s) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(s);
		tx.commit();
		session.close();
	}

	public void delete(School s) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(s);
		tx.commit();
		session.close();
	}

	// Medical services
	public void saveMedical(Medical m) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(m);
		tx.commit();
		session.close();
	}

	public List<Medical> viewMedical() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Medical.class);
		List<Medical> e = cr.list();
		return e;
	}

	public Medical getMedicalById(int mid) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Medical.class);
		cr.add(Restrictions.eq("mid", mid));
		Medical medical = (Medical) cr.uniqueResult();
		return medical;
	}

	public void updateMedical(Medical m) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(m);
		tx.commit();
		session.close();
	}

	public void deleteMedical(Medical m) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(m);
		tx.commit();
		session.close();
	}

	public void saveTemple(Temple t) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(t);
		tx.commit();
		session.close();
	}

	public List<Temple> viewTemple() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Temple.class);
		List<Temple> e = cr.list();
		return e;
	}

	public Temple getTempleById(int tid) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Temple.class);
		cr.add(Restrictions.eq("tid", tid));
		Temple temple = (Temple) cr.uniqueResult();
		return temple;
	}

	public void deleteTemple(Temple t) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(t);
		tx.commit();
		session.close();
	}

	public void savePerson(Person p) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(p);
		tx.commit();
		session.close();
	}

	public List<Person> viewPerson() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Person.class);
		List<Person> e = cr.list();
		return e;
	}

	public Person getPersonById(int pid) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Person.class);
		cr.add(Restrictions.eq("id", pid));
		Person person = (Person) cr.uniqueResult();
		return person;
	}

	public void deletePerson(Person p) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(p);
		tx.commit();
		session.close();
	}

	public List<Categories> viewCategory() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Categories.class);
		List<Categories> e = cr.list();
		return e;
	}

	public void savePost(Post p) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(p);
		tx.commit();
		session.close();
	}

	public List<Post> viewPost() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Post.class);
		List<Post> e = cr.list();
		return e;
	}

	public static List<Post> getPostByCatId(int catId) {
		List<Post> list = new ArrayList<Post>();
		try {
			Connection con = UserDao.getconnection();
			PreparedStatement ps = con.prepareStatement("select * from post where catid=?");
			ps.setInt(1, catId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Post p = new Post();
				p.setPid(rs.getInt("pid"));
				p.setTitle(rs.getString("title"));
				p.setMessage(rs.getString("message"));
				p.setImage(rs.getString("image"));
				// p.setCategories(rs.getInt("catid"));
				p.setUserId(rs.getInt("user_id"));
				p.setPdate(rs.getTimestamp("pdate"));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Categories getCategoryById(int cid) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Categories.class);
		cr.add(Restrictions.eq("cid", cid));
		Categories c = (Categories) cr.uniqueResult();
		return c;
	}

	public void saveQuery(Query q) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(q);
		tx.commit();
		session.close();
	}

	public List<Query> viewQuery() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Query.class);
		List<Query> e = cr.list();
		return e;
	}
	public Query getQueryById(int qid) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Query.class);
		cr.add(Restrictions.eq("id", qid));
		Query query = (Query) cr.uniqueResult();
		return query;
	}

	public void deleteQuery(Query q) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(q);
		tx.commit();
		session.close();
	}

	public void saveShop(Shop s) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(s);
		tx.commit();
		session.close();
	}

	public List<Shop> viewShop() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Shop.class);
		List<Shop> e = cr.list();
		return e;
	}

	public Shop getShopById(int pid) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Shop.class);
		cr.add(Restrictions.eq("id", pid));
		Shop shop = (Shop) cr.uniqueResult();
		return shop;
	}

	public void deleteShop(Shop s) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(s);
		tx.commit();
		session.close();
	}
}

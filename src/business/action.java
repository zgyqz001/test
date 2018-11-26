package business;

public class action{
	DbDao one=new DbDao();
	public String check(String sql,Object...objects) {
		return one.checkpsd(sql,objects);
	}
	public int insert(String sql,Object...objects) {
		return one.insert(sql,objects);
	}
	
}

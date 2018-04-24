package services;

import java.util.ArrayList;
import java.util.List;
import domain.LoanApplication;

public class LoanService {
	private List<LoanApplication> loans = new ArrayList<LoanApplication>();
	
	public void add(LoanApplication application){
		if(!(loans.contains(application))){
			loans.add(application);
			return;
		}
	}
	
	public List<LoanApplication> getAll(){
		return loans;
	}
	
	public void showList(){
		for(int i=0;i<loans.size();i++){
			System.out.println(loans.get(i));
		}
		return;
	}
	
	/*	public int count(){
		return loans.size();
	}
	*/	
}

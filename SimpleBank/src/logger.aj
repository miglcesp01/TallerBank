import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Calendar;

import com.bank.Bank;

aspect Logger {
	
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    String suceso = "";
	
	private void escribirLog(String suceso) {
		// Codigo para escribir en el archivo log
		System.out.println(suceso);
	}
	pointcut deposito(): execution(* moneyMakeTransaction(..));
	pointcut retiro(): execution(* moneyWithdrawal(..));
	
	after() : deposito() {
		suceso = "DEPOSITO - " + cal.getTime();
		escribirLog(suceso);
	}
	
	after() : retiro() {
		System.out.println("RETIRO - " + cal.getTime());
		escribirLog(suceso);
	}
}

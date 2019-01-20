package ScriptDump;

public class CreaScript {
	public static void main (String[] args) {
		String command = "cmd /c start C:\\Users\\enric\\Desktop\\dbBackups\\CreateTaskPianificato.bat";
		try {
			Process p = Runtime.getRuntime().exec(command);
		} catch(Exception e) {
			System.out.println("Backup non eseguito: " + e.toString());
		}
	}
}
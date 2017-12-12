import java.util.List;
import java.util.ArrayList;

public class Spanw {

  private List<Command> history = new ArrayList<Command>();

   public Spanw( ) {
 
   }

   public void storeAndExecute(Command cmd) {
    this.history.add(cmd);
      cmd.execute();
   }
}
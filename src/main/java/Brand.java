import java.util.List;
import org.sql2o.*;
import java.util.ArrayList;

public class Brand {
  private int id;
  private String description;


  public int getId() {
    return id;
  }

  public String getDescription() {
    return description;
  }

  public Brand(String description) {
    this.description = description;
  }


}

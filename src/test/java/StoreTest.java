import java.util.Arrays;
import java.util.List;
import org.junit.*;
import static org.junit.Assert.*;


public class StoreTest {

    @Rule
    public DatabaseRule database = new DatabaseRule();

    @Test
    public void all_emptyAtFirst() {
      assertEquals(Store.all().size(), 0);
    }

    @Test
      public void equals_returnsTrueIfNamesAretheSame() {
        Store firstStore = new Store("Payless");
        Store secondStore = new Store("Payless");
        assertTrue(firstStore.equals(secondStore));
      }


    @Test
      public void save_savesIntoDatabase_true() {
        Store myStore = new Store ("Payless");
        myStore.save();
        assertTrue(Store.all().get(0).equals(myStore));
    }

    @Test
      public void find_findsStoreInDatabase_true() {
        Store myStore = new Store("Payless");
        myStore.save();
        Store savedStore = Store.find(myStore.getId());
        assertTrue(myStore.equals(savedStore));
    }

    
}

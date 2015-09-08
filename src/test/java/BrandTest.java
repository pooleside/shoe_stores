import org.junit.*;
import static org.junit.Assert.*;
import org.junit.Rule;
import java.util.List;
import java.util.ArrayList;

public class BrandTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
    public void all_emptyAtFirst() {
      assertEquals(Brand.all().size(), 0);
    }

    @Test
    public void equals_returnsTrueIfDescriptionsAretheSame() {
      Brand firstBrand = new Brand("Nike");
      Brand secondBrand = new Brand("Nike");
      assertTrue(firstBrand.equals(secondBrand));
  }


    @Test
    public void save_returnsTrueIfDescriptionsAretheSame() {
      Brand myBrand = new Brand("Nike");
      myBrand.save();
      assertTrue(Brand.all().get(0).equals(myBrand));
  }

    @Test
      public void save_assignsIdToObject() {
        Brand myBrand = new Brand("Nike");
        myBrand.save();
        Brand savedBrand = Brand.all().get(0);
        assertEquals(myBrand.getId(), savedBrand.getId());
  }

    @Test
      public void find_findsBrandInDatabase_true() {
        Brand myBrand = new Brand("Nike");
        myBrand.save();
        Brand savedBrand = Brand.find(myBrand.getId());
        assertTrue(myBrand.equals(savedBrand));
    }

    @Test
      public void addStore_addsStoreToBrand() {
        Store myStore = new Store("Payless");
        myStore.save();
        Brand myBrand = new Brand("Nike");
        myBrand.save();
        myBrand.addStore(myStore);
        Store savedStore = myBrand.getStores().get(0);
        assertTrue(myStore.equals(savedStore));
  }
    @Test
      public void getStores_returnsAllStores_ArrayList() {
        Store myStore = new Store("Payless");
        myStore.save();
        Brand myBrand = new Brand("Nike");
        myBrand.save();
        myBrand.addStore(myStore);
        List savedStores = myBrand.getStores();
        assertEquals(savedStores.size(), 1);
  }

}

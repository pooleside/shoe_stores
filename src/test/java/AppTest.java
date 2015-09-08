import org.fluentlenium.adapter.FluentTest;
import org.junit.ClassRule;
import org.junit.Rule;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.junit.rules.ExternalResource;
import org.sql2o.*;
import static org.fluentlenium.core.filter.FilterConstructor.*;
import static org.assertj.core.api.Assertions.assertThat;


public class AppTest extends FluentTest {
  public WebDriver webDriver = new HtmlUnitDriver();

  @Override
  public WebDriver getDefaultDriver() {
    return webDriver;
  }

  @ClassRule
  public static ServerRule server = new ServerRule();

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
    public void rootTest() {
      goTo("http://localhost:4567/");
      assertThat(pageSource()).contains("Stores");
    }
    @Test
    public void storeIsAdded() {
      goTo("http://localhost:4567/stores");
      fill("#name").with("Macys");
      submit("#btn");
      assertThat(pageSource()).contains("Macys");
    }

    @Test
    public void brandIsAdded() {
      goTo("http://localhost:4567/brands");
      fill("#description").with("Sketchers");
      submit("#btn");
      assertThat(pageSource()).contains("Sketchers");
    }

    @Test
      public void storeIsDeleted() {
        Store newStore = new Store("Macys");
        newStore.save();
        goTo("http://localhost:4567/stores/:id/update");
        submit("#delbtn");
        assertThat(pageSource()).doesNotContain("Macys");
      }

    @Test
    public void storeIsUpdated() {
      Store newStore = new Store("Macys");
      newStore.save();
      String storePath = String.format("http://localhost:4567/stores/%d/update", newStore.getId());
      goTo(storePath);
      fill("#name").with("Macys5");
      submit("#update_name");
      assertThat(pageSource()).contains("Macys5");
    }

}

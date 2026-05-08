package bdd;

import com.intuit.karate.Results;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import com.intuit.karate.Runner;

import static org.junit.jupiter.api.Assertions.assertEquals;

class RunnerTest {

    @Test
    void test() {
        Results results =
                Runner.path("classpath:bdd")
                        .parallel(1);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @BeforeAll
    static void beforeClass() {
        System.setProperty("Ejecutando pruebas", "Karate Runner");
    }

    @AfterAll
    static void afterClass() {
        System.out.println("Pruebas finalizadas");
    }
}

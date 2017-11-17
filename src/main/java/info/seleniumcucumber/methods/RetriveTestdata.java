package info.seleniumcucumber.methods;
import com.esotericsoftware.yamlbeans.YamlException;
import com.esotericsoftware.yamlbeans.YamlReader;
import org.yaml.snakeyaml.Yaml;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Map;

public class RetriveTestdata {

    public  Map<String, Map<String, String>>  YamlFileReader() throws FileNotFoundException, YamlException {
        Yaml yaml = new Yaml();
        YamlReader reader = new YamlReader(new FileReader("TestData/data.yaml"));

        Object object = reader.read();
        System.out.println(object);
        Map<String, Map<String, String>> map = (Map<String, Map<String, String>>) object;
        return  map;
    }
}

import fr.inria.papart.procam.*;
import org.bytedeco.javacpp.*;
import tech.lity.rea.svgextended.*;
import org.reflections.*;
import toxi.geom.*;
import org.openni.*;

void settings(){
    size(640, 480, P3D);
}

void setup(){
    Papart papart = Papart.seeThrough(this);
    papart.loadSketches() ;
    papart.startTracking() ;
}

void draw(){
}

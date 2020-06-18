/**
 * Gravitational Attraction (3D) 
 * by Daniel Shiffman.  
 * 
 * Simulating gravitational attraction 
 * G ---> universal gravitational constant
 * m1 --> mass of object #1
 * m2 --> mass of object #2
 * d ---> distance between objects
 * F = (G*m1*m2)/(d*d)
 *
 * For the basics of working with PVector, see
 * http://processing.org/learning/pvector/
 * as well as examples in Topics/Vectors/
 * 
 */
import beads.*;
import org.jaudiolibs.beads.*;

//import net.beadsproject.beads.core.AudioContext;

/*
import net.beadsproject.beads.analysis.featureextractors.FFT;
import net.beadsproject.beads.analysis.featureextractors.PowerSpectrum;
import net.beadsproject.beads.analysis.segmenters.ShortFrameSegmenter;

import net.beadsproject.beads.core.AudioIO;
import net.beadsproject.beads.core.UGen;
import net.beadsproject.beads.ugens.Gain;
*/

AudioContext ac;

//    ShortFrameSegmenter sfs;
//    PowerSpectrum ps;

// A bunch of planets
Planet[] planets = new Planet[10];
// One sun (note sun is not attracted to planets (violation of Newton's 3rd Law)
Sun s;

// An angle to rotate around the scene
float angle = 0;

void setup() {
  //size(640, 360, P3D);
  //surface.setResizable(true);
  fullScreen(P3D);
  // Some random planets
  for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet(random(0.1, 2), random(-width/2, width/2), random(-height/2, height/2), random(-100, 100));
  }
  // A single sun
  s = new Sun();

  // jack support
  ac = new AudioContext(new AudioServerIO.Jack(), 256, new IOAudioFormat(48000, 16, 2, 0, true, false));
/*
        //getting 4 audio inputs (channels 1,2,3,4)
        UGen microphoneIn = ac.getAudioInput(new int[]{1,2,3,4});
        Gain g = new Gain(ac, 1, 0.5f);
        g.addInput(microphoneIn);
        ac.out.addInput(g);

        println("no. of inputs:  " + ac.getAudioInput().getOuts()); 

        //test get some FFT power spectrum data form the 
        sfs = new ShortFrameSegmenter(ac);
        sfs.addInput(ac.out);
        FFT fft = new FFT();
        sfs.addListener(fft);
        ps = new PowerSpectrum();
        fft.addListener(ps);
        ac.out.addDependent(sfs);
*/
  ac.start();
}

void draw() {
/*
        background(255);
        float[] features = ps.getFeatures();
        if(features != null){
            for(int x = 0; x < width; x++){
              int featureIndex = (x * features.length) / width;
              int barHeight = Math.min((int)(features[featureIndex] *
                                                height), height - 1);
              line(x, height, x, height - barHeight);
            } 
        }
*/
  background(0);
  // Setup the scene
  sphereDetail(8);
  lights();
  translate(width/2, height/2);
  rotateY(angle);


  // Display the Sun
  s.display();

  // All the Planets
  for (Planet planet : planets) {
    // Sun attracts Planets
    PVector force = s.attract(planet);
    planet.applyForce(force);
    // Update and draw Planets
    planet.update();
    planet.display();
  }

  // Rotate around the scene
  angle += 0.003;

}

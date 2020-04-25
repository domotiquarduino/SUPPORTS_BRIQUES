use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\brique_ajustable\bloc_brique.scad>
use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\PIECES_ELECTRONIQUES\uno\carte_uno.scad>
use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\PIECES_ELECTRONIQUES\visserie\M2.scad>
use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\PIECES_ELECTRONIQUES\pile\pile_9v.scad>

include <MCAD/boxes.scad>;

//___________________________________VARIABLES___________________________________
hauteur_brique          =1;   // 1,2 ou 3
afficher_brique         ="o"; // "o" ou "n"
afficher_socle          ="o"; // "o" ou "n"
afficher_support_pile   ="o"; // "o" ou "n"

rotation_socle_360      ="n";
mouvement_hauteur_socle ="n";

afficher_boitier        ="n"; // "o" ou "n"
hauteur_boitier         =1;   // 1 ou 2

afficher_fixation       ="o"; // "o","n"
afficher_arduino_uno    ="o"; // "o","n"
afficher_M2_femelle     ="o"; // "o","n"
afficher_M2_male        ="o"; // "o","n"
afficher_pile           ="o"; // "o","n"

// (hauteur 1) z=3.167
// (hauteur 2) z=6.334
// (hauteur 3) z=9.501

  x=63.82;
  y=79.82;
  z=6.00;
  //z=3.167*1;  // hauteur brique officielle
  //cube([x,y,z]);

//___________________________________CONDITIONS__________________________________

union()
{
 if(rotation_socle_360 =="o" && mouvement_hauteur_socle =="o")
 {
if(afficher_socle=="o") translate([0,0,50]) translate([0,0,-51.8*$t])rotate([0,0,360*$t]) color("Cornsilk") socle();
if(afficher_brique=="o") translate([0,0,50]) translate([0,0,-51.8*$t])rotate([0,0,360*$t]) color("Cornsilk") brique();
if(afficher_support_pile=="o") translate([0,0,50]) translate([0,0,-51.8*$t])color("Cornsilk") rotate([0,0,360*$t]) translate([0.00,0.00,3.00])rotate([0,0,90]) support_pile();
 }
 else if (rotation_socle_360 =="o" && mouvement_hauteur_socle =="n") 
 {
if(afficher_socle=="o") rotate([0,0,360*$t]) color("Cornsilk") socle();
if(afficher_brique=="o") rotate([0,0,360*$t]) color("Cornsilk") brique();
if(afficher_support_pile=="o") rotate([0,0,360*$t]) translate([0.00,0.00,3.00])rotate([0,0,90]) color("Cornsilk") support_pile();        
 }
 else if (rotation_socle_360 =="n" && mouvement_hauteur_socle =="o") 
 {
if(afficher_socle=="o") translate([0,0,50]) translate([0,0,-51.8*$t]) color("Cornsilk") socle();
if(afficher_brique=="o") translate([0,0,50]) translate([0,0,-51.8*$t]) color("Cornsilk") brique();
if(afficher_support_pile=="o") translate([0,0,50]) translate([0,0,-51.8*$t]) translate([0.00,0.00,3.00])rotate([0,0,90]) color("Cornsilk")   support_pile();        
 }
 else
 {
if(afficher_socle=="o") color("Cornsilk") socle();
if(afficher_brique=="o") color("Cornsilk") brique();
if(afficher_support_pile=="o") translate([0.00,0.00,3.00])rotate([0,0,90]) color("Cornsilk") support_pile();        
 }
}
if(afficher_boitier=="o") 
{ 
  if(hauteur_boitier==1)     
  translate ([0.00,0.00,36.05])rotate([0.00,180,180]) boitier();
  if(hauteur_boitier==2)     
  translate ([0.00,0.00,36.05*3])rotate([0.00,180,180]) boitier();  
}      
if(afficher_arduino_uno=="o") translate([0,0.5,21.25-2.85]) rotate([0,0,180])  arduino_uno();
if(afficher_M2_femelle=="o")
{
//translate ([24,19,13.02-2.85]) M2_femelle_male();
//translate ([-24,20.5,13.02-2.85]) M2_femelle_male();
translate ([-19,-31.5,13.02-2.85]) M2_femelle_male();
translate ([8.5,-31.5,13.02-2.85]) M2_femelle_male();
}
if(afficher_M2_male=="o")
{
translate ([24,19,23.1-2.85]) M2_male();
translate ([-24,20.5,23.1-2.85]) M2_male();
translate ([-19,-31.5,23.1-2.85]) M2_male();
translate ([8.5,-31.5,23.1-2.85]) M2_male();
}
if(afficher_fixation=="o")
{  
 if(hauteur_brique==1) color("Cornsilk") fixation();
 if(hauteur_brique==2) translate([0,0,-3.17*2+0.01])color("Cornsilk") fixation();
 if(hauteur_brique==3) translate([0,0,-3.17*3+0.01])color("Cornsilk") fixation();
}

 if(afficher_pile=="o") translate([0,8.6,3.05-2.9]) rotate([0,0,90]) pile_9V();

//___________________________________MODULES____________________________________
module socle()
{
       module m3vis(longueur)
       {          
           cylinder(r=1.55,h=longueur,center=true, $fn=24);           
           translate([0.00,0.00,(longueur/2)+(2.50/2)])
           cylinder(r=5.30/2,h=2.50,center=true,$fn=24);
       }
       
       translate ([24,19.0,1.5]) cube([10,10,5],center=true);
       translate ([-24,20.5,1.5]) cube([10,10,5],center=true);
       translate ([-19,-31.5,1.5]) cube([10,10,5],center=true);
       translate ([8.5,-31.5,1.5]) cube([10,10,5],center=true);
       
       difference()
       {
              union()
              {                    
          translate([0.00,0.00,-1.40])            
             for(i=[
           //    [-24,20.5,10.9],
               [-19,-31.5,10.9],
               [8.5,-31.5,10.9],
           //    [24,19,10.9]
               ])
          {
           translate([0.00,0.00,-4.40])
           translate(i)
           cylinder(r1=4.50,r2=4.00,h=10.00,center=true,$fn=60);
          } 
     
           translate([0.00,0.00,-1.40])            
             for(i=[
               [-24,20.5,10.9+3.9],
               [24,19,10.9+3.9]
               ])
          {
           translate([0.00,0.00,-4.40])
           translate(i)
           cylinder(r1=3.90,r2=2.80,h=10.00+8.3,center=true,$fn=60);
          }    
          
               }                      
        union()
        {
          translate([0.00,0.00,3.00/2])    
           for(i=[
               [-24,20.5,10.9+9],
               [-19,-31.5,10.9],
               [8.5,-31.5,10.9],
               [24,19,10.9+9]
           ])
           {
              translate([0,0,-3/2-1])      
              translate(i)
              rotate([180,0,0]) m3vis(20);  
           }
        }
       }
}

//(bloc 1)  x ou y = 7.82 
//(bloc 2)  x ou y = 15.82 
//(bloc 3)  x ou y = 23.82
//(bloc 4)  x ou y = 31.82 
//(bloc 5)  x ou y = 39.82
//(bloc 6)  x ou y = 47.82
//(bloc 7)  x ou y = 55.82 
//(bloc 8)  x ou y = 63.82 
//(bloc 9)  x ou y = 71.82
//(bloc 10) x ou y = 79.82
//(bloc 11) x ou y = 87,82
//(bloc 12) x ou y = 95,82
//(bloc 13) x ou y = 103,82
//(bloc 14) x ou y = 111,82
//(bloc 15) x ou y = 119,82
//(bloc 16) x ou y = 127,82
//(bloc 17) x ou y = 135,82
//(bloc 18) x ou y = 143,82

module support_pile()
{
 Longueur = 45.77; //axe X 
 Largeur  = 26.62; //axe Y   
 Hauteur  = 16.95; //axe Z 
       
    translate([8.59,0.00,-3])   
    difference()
    {
     //boite contour
    translate([0.00,0.01,Hauteur/2]) cube([49.00,31.82,Hauteur],center=true);
    //contour carré  intérieur   
    translate([0,0,Hauteur/2+0.001]) cube([Longueur,Largeur+0.28,Hauteur], center=true);  
    translate([0+2.50,0,Hauteur/2+0.001]) cube([Longueur,Largeur-3,Hauteur], center=true);
    }
}

module boitier()
{  
          difference()
          {       
          //contour boitier
          translate([0.00,0.00,-2.00-1]) cube([x,y,0+z+1.50],center=true );
          translate([0.00,0.00,-0.40+0.1]) cube([x-8.62-0.26-5,y-7.92-0.26-5,0+z+2.60],center=true);                  
          }
          difference()
          {
          //trou intérieur boitier
          translate([0.00,0.00,-0.40]) cube([x-8.62-0.26,y-7.92-0.26,0+z+2.60],center=true); 
        
          }
          difference()
          {  
           translate([0.00,0.00,z*6/2]) cube([x,y,z*6],center=true);          
           translate([0.00,0.00,20.00]) roundedBox([57.00+0.27,75.00+0.27,33.00],5.00,true);                       
          } 
} 




module brique()
{  
  if(hauteur_brique==1)
  { 
   union()
   {    
    difference()
    {   
     translate([-x/2,-y/2,-3.163]) bloc_ajustable();            
     translate([0.00,0.00,2.0067]) cube([220,220,4.00],center=true);                  
    }
   }
  } 
  if(hauteur_brique==2)
  { 
   union()
   {    
    difference()
    {
    translate([-x/2,-y/2,-3.17*2+0.01]) bloc_ajustable(); 
    translate([0.00,0.00,2.0034]) cube([220,220,4.00],center=true);                 
    }
   }
  }
  if(hauteur_brique==3)
  { 
   union()
   {    
    difference()
    {
     translate([-x/2,-y/2,-3.17*3+0.01]) bloc_ajustable(); 
     translate([0.00,0.00,2.0001]) cube([220,220,4],center=true);                   
    }
   }
  } 
}

module bloc_ajustable()
{
  if(y==79.82 && x==63.82) bloc10x8();              
}

module bloc10x8()
{
  bloc(2,8,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=true);   
  translate ([0,24.0,0]) bloc(7,8,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=true);  
}


module fixation()
{
 translate ([24.090-(2.65*3)-0.05,8.09+(2.67*6)-0.020,-6.329]) bloc2x2();
 translate ([24.090-(2.65*3)-0.05,8.09+(-2.67*9)+0.03,-6.329]) bloc2x2();      
 translate ([-39.91+(2.65*3)+0.05,8.09+(2.67*6)-0.020,-6.329]) bloc2x2();
 translate ([-39.91+(2.65*3)+0.05,8.09+(-2.67*9)+0.03,-6.329]) bloc2x2();
 translate ([-39.91+(2.65*3)+0.05,-23.91-(2.67*6)+0.020,-6.329]) bloc2x2();
 translate ([24.090-(2.65*3)-0.05,-23.91-(2.67*6)+0.020,-6.329]) bloc2x2();
}

module bloc2x2()
{
  bloc(2,2,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=true);     
}




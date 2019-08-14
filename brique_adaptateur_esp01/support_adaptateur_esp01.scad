use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\brique_ajustable\bloc_brique.scad>
use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\PIECES_ELECTRONIQUES\adaptateur_esp01\adaptateur_esp01.scad>

//___________________________________VARIABLES___________________________________
coin_arrondi               ="o"; // "o" ou "n"
hauteur_brique             =1;   // 1,2 ou 3

afficher_brique            ="o"; // "o" ou "n"
mouvement_hauteur_brique   ="n"; // "o" ou "n"
rotation_360_brique        ="n"; //x,y,z,n

afficher_socle             ="o"; // "o" ou "n"
mouvement_hauteur_socle    ="n"; // "o" ou "n"
rotation_360_socle         ="n"; //x,y,z,n

afficher_module_esp01      ="o"; // "o" ou "n"
mouvement_hauteur_adapt    ="n"; // "o" ou "n"
rotation_360_adapt         ="n"; //x,y,z,n

afficher_boitier           ="o"; // "o" ou "n"
hauteur_boitier            =2;   // 1 ou 2
mouvement_hauteur_boitier  ="n"; // "o" ou "n"
rotation_360_boitier       ="n"; //x,y,z,n

afficher_esp01             ="o"; // "o" ou "n"
mouvement_hauteur_esp      ="n"; // "o" ou "n"
rotation_360_esp           ="n"; //x,y,z,n

afficher_fixation          ="o"; // "o" ou "n"
mouvement_hauteur_fixation ="n"; // "o" ou "n"
rotation_360_fixation      ="n"; //x,y,z,n

afficher_texte             ="n"; // "o" ou "n"

// (hauteur 1) z=3.167
// (hauteur 2) z=6.334
// (hauteur 3) z=9.501

  x=31.82;
  y=47.82;
  z=6.00;
  
  x1=23.95;
  y1=42.15;
  z1=1.65; 
  
  //z=3.167*1;  // hauteur brique officielle
  //cube([x,y,z]);
  

    
//___________________________________CONDITIONS/MOUVEMENTS__________________________________   
 if(rotation_360_adapt=="y" && mouvement_hauteur_adapt =="o")
 {       
  rotate([360*$t,0,0]) translate([-x1/2,-y1/2,3]) translate([0,0,50]) translate([0,0,-50.3*$t]) adaptateur_esp01();
 }
 else if (rotation_360_adapt=="x" && mouvement_hauteur_adapt =="o") 
 {       
  rotate([0,360*$t,0]) translate([-x1/2,-y1/2,3]) translate([0,0,50]) translate([0,0,-50.3*$t]) adaptateur_esp01();
 }
 else if (rotation_360_adapt=="z" && mouvement_hauteur_adapt =="o") 
 {       
  rotate([0,0,360*$t]) translate([-x1/2,-y1/2,3]) translate([0,0,50]) translate([0,0,-50.3*$t]) adaptateur_esp01();
 }
 else if(rotation_360_adapt=="y" && mouvement_hauteur_adapt =="n")
 {       
  rotate([360*$t,0,0]) translate([-x1/2,-y1/2,3]) adaptateur_esp01();
 }
 else if (rotation_360_adapt=="x" && mouvement_hauteur_adapt =="n") 
 {       
  rotate([0,360*$t,0]) translate([-x1/2,-y1/2,3]) adaptateur_esp01();
 }
 else if (rotation_360_adapt=="z" && mouvement_hauteur_adapt =="n") 
 {       
  rotate([0,0,360*$t]) translate([-x1/2,-y1/2,3]) adaptateur_esp01();
 }
 else if(rotation_360_adapt=="n" && mouvement_hauteur_adapt =="o")
 {       
  translate([-x1/2,-y1/2,z1/2+2.21]) translate([0,0,50]) translate([0,0,-50.3*$t]) adaptateur_esp01();
 } 
if(afficher_module_esp01=="o")translate([-x1/2,-y1/2,z1/2+2.21]) adaptateur_esp01();
 
 
 if(rotation_360_esp=="y" && mouvement_hauteur_esp =="o")
 {       
  translate([0,0,50-3.01]) translate([0,0,-50.3*$t]) rotate([360*$t,0,0]) esp01();
 }
 else if (rotation_360_esp=="x" && mouvement_hauteur_esp =="o") 
 {       
  translate([0,0,50-3.01]) translate([0,0,-50.3*$t]) rotate([0,360*$t,0]) esp01();
 }
 else if (rotation_360_esp=="z" && mouvement_hauteur_esp =="o") 
 {       
  translate([0,0,50-3.01]) translate([0,0,-50.3*$t]) rotate([0,0,360*$t]) esp01();
 }
 else if(rotation_360_esp=="y" && mouvement_hauteur_esp =="n")
 {       
  rotate([360*$t,0,0]) esp01();
 }
 else if (rotation_360_esp=="x" && mouvement_hauteur_esp =="n") 
 {       
  rotate([0,360*$t,0]) esp01();
 }
 else if (rotation_360_esp=="z" && mouvement_hauteur_esp =="n") 
 {       
  rotate([0,0,360*$t]) esp01();
 }
 else if(rotation_360_esp=="n" && mouvement_hauteur_esp =="o")
 {       
  translate([0,0,50]) translate([0,0,-50.3*$t]) esp01();
 }
if(afficher_esp01=="o") esp01();


 if(rotation_360_socle=="y" && mouvement_hauteur_socle =="o")
 {       
  translate([0,0,50-3.01]) translate([0,0,-50.3*$t]) rotate([360*$t,0,0]) socle();
 }
 else if (rotation_360_socle=="x" && mouvement_hauteur_socle =="o") 
 {       
  translate([0,0,50-3.01]) translate([0,0,-50.3*$t]) rotate([0,360*$t,0]) socle();
 }
 else if (rotation_360_socle=="z" && mouvement_hauteur_socle =="o") 
 {       
  translate([0,0,50-3.01]) translate([0,0,-50.3*$t]) rotate([0,0,360*$t]) socle();
 }
 else if(rotation_360_socle=="y" && mouvement_hauteur_socle =="n")
 {       
  rotate([360*$t,0,0]) socle();
 }
 else if (rotation_360_socle=="x" && mouvement_hauteur_socle =="n") 
 {       
  rotate([0,360*$t,0]) socle();
 }
 else if (rotation_360_socle=="z" && mouvement_hauteur_socle =="n") 
 {       
  rotate([0,0,360*$t]) socle();
 }
 else if(rotation_360_socle=="n" && mouvement_hauteur_socle =="o")
 {       
  translate([0,0,50]) translate([0,0,-50.3*$t]) socle();
 }
if(afficher_socle=="o") socle();



 if(rotation_360_brique=="y" && mouvement_hauteur_brique =="o")
 {       
  translate([0,0,50-3.01]) translate([0,0,-50.3*$t]) rotate([360*$t,0,0]) brique();
 }
 else if (rotation_360_brique=="x" && mouvement_hauteur_brique =="o") 
 {       
  translate([0,0,50-3.01]) translate([0,0,-50.3*$t]) rotate([0,360*$t,0]) brique();
 }
 else if (rotation_360_brique=="z" && mouvement_hauteur_brique =="o") 
 {       
  translate([0,0,50-3.01]) translate([0,0,-50.3*$t]) rotate([0,0,360*$t]) brique();
 }
 else if(rotation_360_brique=="y" && mouvement_hauteur_brique =="n")
 {       
  rotate([360*$t,0,0]) brique();
 }
 else if (rotation_360_brique=="x" && mouvement_hauteur_brique =="n") 
 {       
  rotate([0,360*$t,0]) brique();
 }
 else if (rotation_360_brique=="z" && mouvement_hauteur_brique =="n") 
 {       
  rotate([0,0,360*$t]) brique();
 }
 else if(rotation_360_brique=="n" && mouvement_hauteur_brique =="o")
 {       
  translate([0,0,50]) translate([0,0,-50.3*$t]) brique();
 }
 if(afficher_brique=="o") brique();
  

 
 if(rotation_360_boitier=="y" && mouvement_hauteur_boitier =="o")
 {       
  rotate([0.00,180,180]) translate([0,0,-50-3.01]) translate([0,0,50.3*$t]) rotate([-360*$t,0,0]) boitier();
 }
 else if (rotation_360_boitier=="x" && mouvement_hauteur_boitier =="o") 
 {       
  rotate([0.00,180,180]) translate([0,0,-50-3.01]) translate([0,0,50.3*$t]) rotate([0,-360*$t,0]) boitier();
 }
 else if (rotation_360_boitier=="z" && mouvement_hauteur_boitier =="o") 
 {       
  rotate([0.00,180,180]) translate([0,0,-50-3.01]) translate([0,0,50.3*$t]) rotate([0,0,-360*$t]) boitier();
 }
 else if(rotation_360_boitier=="y" && mouvement_hauteur_boitier =="n")
 {       
  rotate([0.00,180,180]) rotate([360*$t,0,0]) boitier();
 }
 else if (rotation_360_boitier=="x" && mouvement_hauteur_boitier =="n") 
 {       
  rotate([0.00,180,180]) rotate([0,360*$t,0]) boitier();
 }
 else if (rotation_360_boitier=="z" && mouvement_hauteur_boitier =="n") 
 {       
  rotate([0.00,180,180]) translate([0,0,-6.01]) rotate([0,0,-360*$t]) boitier();
 }
 else if(rotation_360_boitier=="n" && mouvement_hauteur_boitier =="o")
 {       
 rotate([0.00,180,180])  translate([0,0,-56.05]) translate([0,0,50.3*$t]) boitier();
 }
if(afficher_boitier=="o") 
{ 
  if(hauteur_boitier==1)     
  translate ([0.00,0.00,6.05])rotate([0.00,180,180]) boitier();
  if(hauteur_boitier==2)     
  translate ([0.00,0.00,38.75])rotate([0.00,180,180]) boitier();  
} 


 if(rotation_360_fixation=="y" && mouvement_hauteur_fixation =="o")
 {       
  translate([0,0,-50-3.01]) translate([0,0,50.3*$t]) rotate([360*$t,0,0]) fixation();
 }
 else if (rotation_360_fixation=="x" && mouvement_hauteur_fixation =="o") 
 {       
  translate([0,0,-50-3.01]) translate([0,0,50.3*$t]) rotate([0,360*$t,0]) fixation();
 }
 else if (rotation_360_fixation=="z" && mouvement_hauteur_fixation =="o") 
 {       
  translate([0,0,-50-3.01]) translate([0,0,50.3*$t]) rotate([0,0,360*$t]) fixation();
 }
 else if(rotation_360_fixation=="y" && mouvement_hauteur_fixation =="n")
 {       
  rotate([360*$t,0,0]) fixation();
 }
 else if (rotation_360_fixation=="x" && mouvement_hauteur_fixation =="n") 
 {       
  rotate([0,360*$t,0]) fixation();
 }
 else if (rotation_360_fixation=="z" && mouvement_hauteur_fixation =="n") 
 {       
  rotate([0,0,360*$t]) fixation();
 }
 else if(rotation_360_fixation=="n" && mouvement_hauteur_fixation =="o")
 {       
  translate([0,0,-50]) translate([0,0,50.3*$t]) fixation();
 }
 if(afficher_fixation=="o") color("Cornsilk") fixation();


//___________________________________MODULES____________________________________
module socle()
{
       union()
      {       
	difference()
        {
          //contour socle
         if(coin_arrondi=="o"){color("Cornsilk") translate([-x/2,-y/2,z]) cube_arrondi(x,y,z,2.22);}
         else{color("Cornsilk") translate([0,0,z/2]) cube([x,y,z],center=true );}
          //trou intérieur socle x=31.00, y=28.00
          translate ([0,0,z/2+2.2]) cube([23.9+0.23+0.10,42+0.23+0.10+0.14,0+z+3.8],center=true); 
               
          translate([0,-y/2+0.2,z-(3.45/2-1.9)])cube([13.1,5.2,2.45],center=true);        
        }
       color("Cornsilk")translate([0,y/2-5.2,z-(1.45/2)-0.15])cube([13.1,5.2,1.45+0.3],center=true);
       color("Cornsilk")translate([0,y/2-5.2+0.4,z-5.2])cube([24.33,4.2,1.3],center=true);
      }
}

module esp01()
{
       color("DimGray") translate([0,8,13.9+2.30]) cube([14.41,25,1],center=true);
       color("Black") translate([-2.2,6.5,13.9+2.30+0.6]) cube([5.2,5.2,0.4],center=true);
       color("Black") translate([4.4,7.1,13.9+2.30+0.6]) cube([4.9,3.6,0.8],center=true);
       color("Gold") translate([0.0,11.1,13.9+2.30+0.6]) cube([3.2,2.7,0.8],center=true);
       color("MistyRose") translate([6.0,15.1,13.9+2.30+0.6]) cube([1.6,1.0,0.4],center=true);
        for (i = [-1:2])  
          { 
            translate([i*2.54-2.54/2,-(2.54/2-0.25)/2,15])                   
            {      
        color("lightblue")cube([0.315*2,0.315*2,6.83],center=true);         
            }
          } 
        for (i = [-1:2])  
          { 
            translate([i*2.54-2.54/2,-(2.54*5/2-0.25)/2,15])                   
            {      
        color("lightblue")cube([0.315*2,0.315*2,6.83],center=true);         
            }
          } 
    for (i = [-1:2]) 
          { 
            translate([i*2.54-2.54/2,-(2.54*5/2-0.25)/2,14.51])           
          {
           color("DarkSlateGray") cube([2.40+0.10,2.40,2.30],center=true);
          }   
          }  
    for (i = [-1:2]) 
          { 
            translate([i*2.54-2.54/2,-(2.54*1/2-0.25)/2,14.51])           
          {
           color("DarkSlateGray") cube([2.40+0.10,2.40,2.30],center=true);
          }   
          } 
         
     for (i = [-1:2])  
          {
           translate([i*2.54-2.54/2,-(2.54*5/2-0.25)/2,16.5])                   
            {                  
           color("grey") cylinder($fa=12,$fn=60,h=1.83,r1=0.9,r2=0.6,center=false); 
            }     
          } 
     for (i = [-1:2])  
          {
           translate([i*2.54-2.54/2,-(2.54*1/2-0.25)/2,16.5])                   
            {                  
           color("grey") cylinder($fa=12,$fn=60,h=1.83,r1=0.9,r2=0.6,center=false); 
            }     
          } 
       
}


module arrondie()
{
difference() 
{
  difference()
  {
  rotate([0,90,0]) cylinder(h=0.63,r=1.2,$fn=200,center=true);
  rotate([0,0,90]) translate([0,0,-0.75]) cube([2.45,0.632,1.5],center=true); 
  rotate([0,0,90]) translate([-0.6,0,0.5]) cube([1.2,0.632,1.42],center=true);         
  }
   translate([0,0,0])rotate([0,90,0])cylinder(h=0.632,r=0.569,$fn=200,center=true);
}
}

module cube_arrondi(xdim,ydim,zdim,rdim)
{
 $fn=64;
 hull()
 {
  translate([rdim,rdim,-zdim/2]) cylinder(r=rdim, h=zdim, center=true);
  translate([xdim-rdim,rdim,-zdim/2]) cylinder(r=rdim, h=zdim , center=true);    
  translate([rdim,ydim-rdim,-zdim/2]) cylinder(r=rdim, h=zdim, center=true);
  translate([xdim-rdim,ydim-rdim,-zdim/2]) cylinder(r=rdim, h=zdim, center=true);         
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

module boitier()
{ 
      union()
      { 
          difference()
          {       
          //contour boitier                
          if(coin_arrondi=="o"){color("Cornsilk") translate([-x/2,-y/2,0.00]) cube_arrondi(x,y,z,2.22);}
          else{color("Cornsilk") translate([0,0,-3.00]) cube([x,y,z],center=true );}
         
          translate([0.00,0.00,-2.0]) cube([23.9+0.45-0.26-5,42+0.45-0.26-5+0.1,z],center=true);  
  
          translate([0,1.8,-3.9])  cube([12.3,6.7,4.5], center=true);
          translate([0,-(-y/2+3.2-0.33),z-(3.45/2+5.8)])cube([13.1+0.3,5.2+0.9,4.25],center=true);       
          }
        difference()
        {
         //trou intérieur boitier
         color("Cornsilk") translate([0.00,0.00,-0.40-0.8]) cube([23.9+0.45-0.26,42+0.45-0.26+0.1,0+z+2.60-3.9],center=true); 
         translate([0.00,0.00,z-7.77]) cube([23.9+0.45-0.26-5,42+0.45-0.26-5+0.1,z],center=true);          
         translate([0,1.8,-3.1])  cube([12.3,6.7,10], center=true);            
         translate([0,-(y/2-5.2),z-(1.45/2)-4.9])cube([13.1+0.5,5.2,3],center=true);
         translate([0,-(-y/2+3.2),z-(3.45/2+3.6)])cube([13.1+0.3,5.2,3.45],center=true);  
         translate([0,-(-y/2+3.2-0.33),z-(3.45/2+5.8)])cube([13.1+0.3,5.2+0.9,4.25],center=true);                 
        }
      }
       
} 

module brique()
{  
  if(hauteur_brique==1)
  {       
    color("Cornsilk") translate([-x/2,-y/2,-3.163]) bloc_ajustable();            
  } 
  if(hauteur_brique==2)
  {     
    color("Cornsilk") translate([-x/2,-y/2,-3.17*2+0.01]) bloc_ajustable(); 
  }
  if(hauteur_brique==3)
  {    
    color("Cornsilk") translate([-x/2,-y/2,-3.17*3+0.01]) bloc_ajustable(); 
  } 
}


module bloc_ajustable()
{
    if(y==47.82 && x==31.82) bloc6x4();              
}


module bloc6x4()
{
  bloc(6,4,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=true);     
}

module fixation()
{
 color("Cornsilk") translate ([-15.91,8.09,-6.329]) bloc4x2();
 color("Cornsilk") translate ([-15.91,-23.91,-6.329]) bloc4x2();
}


module bloc4x2()
{
  bloc(2,4,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=false);     
}

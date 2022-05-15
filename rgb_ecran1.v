module rgb_ecran1(                      //cel cu chenarul cyan si spate magenta
// lista de porturi

output 	  [2:0] rgb_o,						// se pune reg daca folosim always
input 		[9:0] row_i,	          // era [8:0]  // horizontal
input 		[9:0] column_i		                    // vertical
);



 
// lista parametrii interni
localparam x1     = 120	  ;				//prima treime din imagine(limita)	x1=640/3			//sau parameter dar poate fii schimbat din afara  
localparam x2     = 360   ;				//a doua treime din imagine (limita)
// x1 si x2 sunt pentru coloane, sa stiu de unde incepe cubul pe inaltime si unde se termina
localparam x3     = 40    ;
localparam x4     = 280   ;
// x3 si x4 sunt pentru latime


//// Try2
localparam point1     = 40   ; // lugime

localparam point2     = 280  ; // 240 + 40 
localparam point3     = 640  ; //restul de 360
// Mai importante
localparam point4     = 120  ; // intaltime
localparam point5     = 360  ;
localparam point6     = 480  ;
//// End Try2

//culori
localparam GREEN     = 3'b010;
localparam RED	     = 3'b100;
localparam BLUE	     = 3'b001;
localparam MAGENTA   = 3'b101;
localparam CYAN      = 3'b011;
		

  
// lista semnale interne
// N/A


//COD

//always @ (*)													// * steluta le pune pe toate dar trebuie sa fie de tip reg
//if ((column > x1) & (column < x2)) rgb_o = RED; else
//rgb_o = GREEN;


//cubul cyan incepe de la 120 si se termina la 360 pe inaltime/coloana
//cubul cyan incepe de la 40 si se ternina la 280 pe latime/row
// if = ?
// : = else

assign rgb_o = (column_i > point1 && column_i < point2 && row_i > point4 && row_i <point5) ? CYAN :
                MAGENTA;

// always @ (*)
// begin 
//   ///////////////////////////// Sectiunea 1 ///////////////////////////////
//   if (column_i < point4 )   // col < 120
//     begin
//       rgb_o = MAGENTA;
//     end 
//   ///////////////////////////// Sfarsit Sectiunea 1 ///////////////////////////////

//   ///////////////////////////// Sectiunea 2 ///////////////////////////////
//   else if ( column_i >= point4 && column_i < point5 ) // col >= 120 && col < 360
//     begin
//       if (row_i < point1) // row <40
//        begin
//         rgb_o = MAGENTA;
//        end
//       else if (row_i >= point1 && row_i < point2) // row >= 40 && row < 240
//         begin
//           rgb_o = CYAN;
//         end
//       else if (row_i >= point2 && row_i < point3) // row >= 240 && row < 640
//         begin
//           rgb_o = MAGENTA;
//         end
//     end
//   ///////////////////////////// Sfarsit Sectiunea 2 ///////////////////////////////
// end // end alwayss





//PSEUDO COD + EXPLICATII
 
//for i = 0 : i < 480 : i++ 			// for each line
  //for j = 0 ; j < 640 ; j++ 		// for each pixel (column)

//if (column < x1) rgb_o = GREEN; else
//if ((column > x1) & (column < x2)) rgb_o = RED; else
//if (column > x2 )rgb_o = GREEN;

//sau

//if ((column > x1) & (column < x2)) rgb_o = RED; else
//rgb_o = GREEN

//sau 

// if (column < x1) rgb_o = GREEN; else
// if ((column > x1) & (column < x2)) rgb_o = RED; else
// rgb_o = GREEN;

endmodule
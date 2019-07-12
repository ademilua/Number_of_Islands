package Islands 
with SPARK_Mode=> On 
is
   
   
   N: constant Integer := 4;
   M: constant Integer := 5;
   subtype N_Range is Integer range 1 .. N;
   
   subtype M_Range is Integer range 1 .. M;
   
   --type Integer is range 0 .. 1;
   --  TODO: MAKE THIS TO AN ENUMERATOR TYPE
   type Islands is (Water, Land);
   The_Water : Islands := Water;
   The_Land  : Islands := Land;
  
  
   type Map is array (N_Range, M_Range) of Islands;-- Map is an array of islands type
   type Visited is array (N_Range, M_Range) of Boolean; --Visited is an array of boolean type
   Visited_Array : Visited;
  
   
   -- Visit_Islands takes in an augument of Map_array which represents the 
   -- container to traverse recursively.
   -- i and j are integer types that are used to iterate recursively grabing the next Islands neigbours
   -- horizontally and vertically for each cell on the Map_Array.Therefore i grabs 
   -- the row and j grabs the column and they 
   -- must be within the range of indexes defined within the function.
   -- Visited_Array helps to remember each cell that we had already visited on the Map_Array.
   -- Not to recur on water we return whenever Map_Array(i,j)= 0 (Water)
   -- The digits representing the land(s) to be visited is 1(Land) and not to be visited is 0(Water)
   function Visit_Islands 
     (Map_Array: Map;  I : Integer; J: Integer; Visited_Array : Visited)
      return Visited with Pre => Map_Array'Length(1) = N and Map_Array'Length(2) = M and I >= 0 and J >= 0 and J <= M + 1 and I <= N + 1;
  
  
   
   --and(for all I in N_Range => N_Range(I) <= N) and (for all J in M_Range => M_Range(J) <= M);
   
      
   -- for each i in N_Range ,then j in M_Range is j+1,
   -- which denotes the entire Map_Array.
   function Count_Islands (Map_Array : Map) return Natural with 
     Pre => Map_Array'Length > 0,
     Post => Count_Islands'Result <= N * M;
    -- Post => (if (for all i in Map_Array'Range =>(for all j in Map_Array'Range => Map_Array(i,j) /= Land )) then Count_Islands'Result = 0 
    --else Count_Islands'Result in Map_Array'Range);
     
end Islands;

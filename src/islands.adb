package body Islands 
with SPARK_Mode => On
is

   function Visit_Islands(Map_Array : Map;  i : Integer; j: Integer; Visited_Array : Visited)return Visited
   is
      Vis_Array : Visited := Visited_Array;
   begin
      -- CHECK WE ARE WITHIN RANGE
      -- Check if i and j are within range
      -- and if we visited already the cell with i and j
      -- check if cell is 0 in all these cases return 0
      if i < 1 or else j < 1 or else i > N or else j > M or else Vis_Array(i, j) or else Map_Array(i,j)= Water then
         return Vis_Array;
      end if;
      
      Vis_Array(i, j):= True;
      Vis_Array := Visit_Islands(Map_Array,  i + 1, j, Vis_Array);-- recur the buttom
      Vis_Array := Visit_Islands(Map_Array,  i - 1, j, Vis_Array);-- recur the top
      Vis_Array := Visit_Islands(Map_Array,  i, j + 1, Vis_Array);-- recur the right
      Vis_Array := Visit_Islands(Map_Array,  i, j - 1, Vis_Array);-- recur the left
      
      return Vis_Array;
   end Visit_Islands;

   function Count_Islands (Map_Array : Map) return Natural is

      Visited_Array : Visited:= (others => (others => False));

      Count : Natural := 0;
    
   begin

      for I in N_Range loop
         pragma Loop_Invariant
           (Count <= (I - N_Range'First) * M);

         
         for J in M_Range loop            

            pragma Loop_Invariant
              (Count - Count'Loop_Entry <= J - M_Range'First); 
            

            if Map_Array(I, J) = Land and then not Visited_Array(I, J) then
               Visited_Array := Visit_Islands(Map_Array, i, j,Visited_Array);  
               Count := Count + 1;
            end if;

         end loop;

      end loop;      
  

      return Count;
   end Count_Islands;
   
end Islands;

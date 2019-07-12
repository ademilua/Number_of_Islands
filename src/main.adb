with Ada.Text_IO; use Ada.Text_IO;
with islands; use islands;
procedure Main
  with SPARK_Mode => On
is
   pragma Assertion_Policy (Pre  => Check, Post => Check);

--    Map_Array : constant Map :=   ((1,  0, 1, 0, 0),
--                                  (0, 0, 0, 1, 0),
--                                  (1, 0, 1, 1, 0),
--                                  (0, 1, 1, 1, 0));
Map_Array : constant Map :=     ((Land,  Water, Land, Water, Water),
                                (Land, Water, Water, Land, Water),
                                (Land, Water, Land, Land, Water),
                                (Land, Land, Land, Land, Water));
begin

   --  Insert code here.
   Put_Line("The result is:" & Count_Islands(Map_Array)'Img);
end Main;

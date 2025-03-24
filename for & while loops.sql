## while loops

declare 
    counter number:=1;
begin 
    while counter<5 loop
       dbms_output.put_line(counter);
       counter:=counter+1;
    end loop;
end;



declare
    counter number:=1;
begin
    while counter<=10 loop
        dbms_output.put_line(counter);
        counter:=counter+2;
    end loop;
end;





declare
    counter number:=10;
begin
    while counter>=1 loop
        dbms_output.put_line(counter);
        counter:=counter-1;
    end loop;
end;




declare
    i number:=1;
begin 
    while i<5 loop
         if i=3 then
           i:=i+1;
           continue;
        end if;
        dbms_output.put_line(i);
        i:=i+1;
    end loop;
end;






declare
    i number:=1;
begin 
    while i<5 loop
         if i=3 then
           i:=i+1;
           exit;
        end if;
        dbms_output.put_line(i);
        i:=i+1;
    end loop;
end;




declare
    i number:=2;
begin 
    while i<5 loop
         if mod(i,2)=1 then
           i:=i+1;
           exit;
        end if;
        dbms_output.put_line(i);
        i:=i+1;
    end loop;
end;



declare
    i number:=1;
begin
    while i<20 loop
         if mod(i,3)=0 then
            i:=i+1;
            continue;
        end if;
        dbms_output.put_line(i);
        i:=i+1;
    end loop;
end;
 



declare 
     i number:=1;
     sum number:=0;
begin
    while i<10 loop
        sum:=sum+i;
        if sum>10 then 
            exit;
        end if;
        dbms_output.put_line(sum);
        i:=i+1;
    end loop;
end;



declare
    i number:=1;
begin 
    while i<5 loop
        if i in (2,4) then
            i:=i+1;
            continue;
        end if;
        dbms_output.put_line(i);
        i:=i+1;
    end loop;
end;

##  for loop


begin
    for i in 1..5 loop
        dbms_output.put_line(i);
    end loop;
end;


begin
    for i in reverse 1..5 loop
        dbms_output.put_line(i);
    end loop;
end;



declare
    sum number:=0;
begin
    for i in 1..10 loop
        sum:=sum+i;
        dbms_output.put_line(sum);
    end loop;
end;



declare
    sum number:=1;
begin
    for i in 1..5 loop
        sum:=sum*i;
        dbms_output.put_line(sum);
    end loop;
end;


declare
     a number:=0;
     b number:=1;
     c number;
begin
    for i in 1..10 loop
        c:=a+b;
        dbms_output.put_line(c);
        a:=b;
        b:=c;
    end loop;
end;



begin
    for i in 1..10 loop
         dbms_output.put_line(i*i);
    end loop;
end;



begin
    for i in 1..10 loop
         dbms_output.put_line('multiples of'||i);
         for j in 1..10 loop
             dbms_output.put_line(i*j);
        end loop;
    end loop;
end;




create or replace package scope_demo
is
    g_global = number;
    procedure set_global(number_in in number);
end scope_demo;

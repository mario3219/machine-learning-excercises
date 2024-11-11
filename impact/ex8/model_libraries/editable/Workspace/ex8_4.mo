within Workspace;
model ex8_4
    connector WaterFlow
        Real x;
    end WaterFlow;

    model WaterTank
        WaterFlow F_in, F_out;
        Real A, h;
    equation
        der(h) = -A*sqrt(h)+F_in.x;
        F_out.x = A*sqrt(h);
    end WaterTank;
    
        WaterTank w1(A=1, h(start=1), F_in.x=0.5);
        WaterTank w2(A=1, h(start=1));
    equation
        connect(w1.F_out, w2.F_in);
    
end ex8_4;
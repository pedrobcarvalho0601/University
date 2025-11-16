function [df, X] = NumDiff(f, a, b, N, option);

    x = linspace(a,b,N);
    h = x(2)-x(1);

    Y=f(x)

    switch option
        case 'forward'
           df = diff(Y)/h;
           % df = (1:end-1)=(Y(2:end)-Y(1:end-1)) / h
            X=x(1:end-1)
           
        case 'backward'
            df = diff(Y)/h;
          %  df = (2:end)=(Y(2:end)-Y(1:end-1)) / h
            X = x(2:end);
          
        case 'central'
            df = (Y(3:end)-Y(1:end-2)) / (2*h);
            X = x(2:end-1);

        otherwise
            error("invalido");
            
       
    end

end
function [df, X] = NumDiff(f, a, b, n, option);

    X = linspace(a,b,N);
    h = X()-X();

    Y=f(X);

    df = zeros(1,N);

    switch option
        case 'forward'
            df(1:end-1)=(Y(2:end)-Y(1:end-1))
            df(end) = NaN;
           
        case 'backward'
            df(2:end)=(Y(2:end)-Y(1:end-1))
            df(1) = NaN;
          
        case 'central'
            df(2:end-1)=(Y(3:end)-Y(1:end-2))
            df([1, end]) = NaN;

        otherwise
            error("invalido");
            
       
    end
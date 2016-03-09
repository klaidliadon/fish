function go-deploy --argument file server
      if test (count $argv) -ne 2 ;
            echo "Usage: go-deploy <filename> <server>";
            return;
      end;
      set file $argv[1]
      set binary (echo $file | sed 's/.go$//');
      set server $argv[2]
      begin
            echo "Deleting"; rm -f $binary;
            echo "Building"; 
            if not go-linux -o $binary $file;
                  return
            end;
            echo "Compressing"; rm -f "$binary.gz"; gzip $binary;
            echo "Uploading"; scp -q $binary.gz $server:;
            echo "Extracting"; ssh $server "rm $binary; gunzip ./$binary.gz; chmod +x ./$binary;"
            echo "Connecting"; ssh $server
      end;
end

<?php

class MyDatabase
{
    private $connection;
    
    public function __construct($servername, $username, $password, $dbname)
    {
        $this->connection = mysqli_connect($servername, $username, $password, $dbname);
        
        if (!$this->connection) {
            die("Connection failed: " . mysqli_connect_error());
        }
    }
    
    public function __destruct()
    {
        mysqli_close($this->connection);
    }
    
    /**
     * @param $sql String Query (SELECT) a ejecutar en la base de datos
     * @return array Set de datos o vacio en error
     */
    public function query($sql)
    {
        
        if (!$databaseResult = mysqli_query($this->connection, $sql)) {
            echo("ERROR");
            var_dump($this->connection);
            return [];
        }
        
        return mysqli_fetch_all($databaseResult, MYSQLI_ASSOC);
    }
    
    /**
     * Este es para hacer inserts
     *
     * @param $sql String Insert a ejecutar en la base de datos
     * @return bool Insert OK o error_list
     */
    public function insert($sql)
    {
        
        if (!$databaseResult = mysqli_query($this->connection, $sql)) {
            var_dump($this->connection);
            return mysqli_error_list($this->connection);
        }
        
        return $databaseResult;
    }
    
    public function update($sql)
    {
        return $this->insert($sql);
    }
    
    public function delete($sql)
    {
        return $this->insert($sql);
    }
    
}
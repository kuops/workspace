<?php
    $mysql = new mysqli();
    $mysql->connect("mysql","root","123456");
    if(!$mysql) echo "MySQL connect failed!";
    else echo "Hello MySQL!<br/>";

    $redis = new Redis();
    $redis->connect("redis","6379");
    $redis->auth('123456');
    $redis->set("hello","Hello Redis!",["nx", "ex"=>10]);
    echo $redis->get("hello")."<br/>";

    echo "Extensions:<br/>";
    foreach (get_loaded_extensions() as $i => $name) {
        echo "<li>",$name, " == ", phpversion($name), "<br/>";
    }
?>

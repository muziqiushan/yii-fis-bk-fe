<?php

    include_once("data.php");

    function findItems($list, $find) {
        $items = array();
        $l = count($list);
        for ($i = 0; $i < $l; $i++) {
            if (strpos($list[$i], $find) !== false) {
                $items[] = array(
                        "id" => $i,
                        "tag" => 'unknown',
                        "label" => $list[$i]
                    );
            }
        }
        return $items;
    }

    $data = array();

    $univTypeId = 1;
    if (isset($_REQUEST["univTypeId"])) {
        $univTypeId = $_REQUEST["univTypeId"];
    }

    if ($_REQUEST["type"] != "major") {
        $data = findItems($univType[$univTypeId], $_REQUEST["word"]);
    }
    else {
        $data = findItems($major, $_REQUEST["word"]);
    }

    $ret = array(
        "status" => 0,
        "msg" => "",
        "data" => $data
    );

    echo json_encode($ret);
?>

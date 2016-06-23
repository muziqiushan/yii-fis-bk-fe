<?php

    include_once("data.php");

    function genItems($list, $order) {
        $orders = explode(",", $_REQUEST["order"]);
        $orderItem = $orders[0];
        $order = $orders[1];
        $items = array();
        $count = count($list);
        if ($orderItem == "exam_level") {
            $maxHeat = 100;
        }
        else {
            $maxHeat = 9999999;
        }
        $interval = 200 * $maxHeat / $count;
        if ($order == "asc") {
            $i = -$count;
            $l = 0;
            $heat = 0;
        }
        else {
            $i = 0;
            $l = $count;
            $heat = $maxHeat;
        }
        for (; $i < $l; $i++) {
            if ($order == "asc") {
                $id = -($i + 1);
                $heat = $heat + rand(0, $interval) / 100;
            }
            else {
                $id = $i;
                $heat = $heat - rand(0, $interval) / 100;
            }

            if ($heat < 0) {
                $heat = 0;
            }
            if ($heat > $maxHeat) {
                $heat = $maxHeat;
            }

            if ($orderItem == "exam_level") {
                $value = array($list[$id], rand(1, 99999), round($heat));
            }
            else {
                $value = array($list[$id], round($heat), rand(0, 100));
            }

            $items[] = array(
                    "id" => $id,
                    "trend" => round(rand(0.5, 3.4999999)) - 2,
                    "value" => $value
                );
        }
        return $items;
    }

    $data = array(
        "fields" => array(),
        "items" => array()
    );

    $order = "exam_heat,desc";
    if (isset($_REQUEST["order"])) {
        $order = $_REQUEST["order"];
    }

    $univTypeId = 1;
    if (isset($_REQUEST["univTypeId"])) {
        $univTypeId = $_REQUEST["univTypeId"];
    }

    if ($_REQUEST["type"] != "major") {
        $data["fields"] = array("univ", "exam_heat", "exam_level");
        $data["items"] = genItems($univType[$univTypeId], $order);
    }
    else {
        $data["fields"] = array("major", "exam_heat", "exam_level");
        $data["items"] = genItems($major, $order);
    }

    $ret = array(
        "status" => 0,
        "msg" => "",
        "data" => $data
    );

    echo json_encode($ret);
?>

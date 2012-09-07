<?php

$xml = new DOMDocument;
$xml->load('first.xml');

$xsl = new DOMDocument;
$xsl->load('first.xsl');

$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl);

$newXML = $proc->transformToXML($xml);

echo $newXML;

?>

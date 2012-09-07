<?php

$xml = new DOMDocument;
$xml->load('second.xml');

$xsl = new DOMDocument;
$xsl->load('second.xsl');

$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl);

$newXML = $proc->transformToXML($xml);

echo $newXML;

?>

<?php
return [
    'versao' => 'v1.8.0.0',
    'ultimaAtualizacao' => '24/03/2022 08:34',
    'idSistema' => '33',//id deste sistema no CSD
    'siglaSistema' => 'Intranet',
    'nomeSistema' => 'Intranet - Companhia de Saneamento de Sergipe',
    'nomeSistemaMax' => 'INTRANET - COMPANHIA DE SANEAMENTO DE SERGIPE',
    'srcFiles' => '/mnt/anexos_sistemas/intrasite/',
    'srcFilesForm' => '/mnt/forms/',
    'limitSlide' => 5,
    'limitDestaque' => 3,
    'Permissaos' => [
        'administrador' => 69,
        'achados_perdidos' => 99,
	    'expresso_saneamento' => 100,
    ],
    'emailSugestao' => ['ronaldojunior@deso-se.com.br'],
    'csd' => [
        'url' => 'https://csd.deso.se.gov.br/webservices/login', 
        'usuario' => 'wsCSD',
        'senha' => 'cfiYsX0nG5HmYhyK',
    ],
    'emailAchadosEPerdidos' => 'capa@deso-se.com.br'
];

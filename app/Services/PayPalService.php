<?php

namespace App\Services;

use PayPalCheckoutSdk\Core\PayPalHttpClient;
use PayPalCheckoutSdk\Core\SandboxEnvironment;
use PayPalCheckoutSdk\Core\ProductionEnvironment;

class PayPalService
{
    public function client()
    {
        $clientId = config('paypal.client_id');
        $clientSecret = config('paypal.client_secret');
        $sandbox = config('paypal.sandbox', true);

        $environment = $sandbox
            ? new SandboxEnvironment($clientId, $clientSecret)
            : new ProductionEnvironment($clientId, $clientSecret);

        return new PayPalHttpClient($environment);
    }
} 
<?php

declare(strict_types=1);

namespace Yiisoft\Yii\Sentry\Tests\Stub;

use Symfony\Component\Console\Command\Command as BaseCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

final class FatalErrorCommand extends BaseCommand
{
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        /**
         * Note: E_USER_ERROR has been deprecated in terms of php 8.4
         */
        throw new \RuntimeException('Console fatal error test.');
    }
}

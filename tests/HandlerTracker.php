<?php

declare(strict_types=1);

namespace Yiisoft\Yii\Sentry\Tests;

class HandlerTracker
{
    private static array $errorHandlers = [];
    private static array $exceptionHandlers = [];

    public static function setErrorHandler(callable $handler, string $context = ''): void
    {
        $previous = set_error_handler($handler);
        self::$errorHandlers[] = [
            'handler' => $handler,
            'previous' => $previous,
            'context' => $context,
            'time' => microtime(true),
        ];
        error_log("[HandlerTracker] set_error_handler called: $context");
    }

    public static function restoreErrorHandler(string $context = ''): void
    {
        restore_error_handler();
        error_log("[HandlerTracker] restore_error_handler called: $context");
    }

    public static function setExceptionHandler(callable $handler, string $context = ''): void
    {
        $previous = set_exception_handler($handler);
        self::$exceptionHandlers[] = [
            'handler' => $handler,
            'previous' => $previous,
            'context' => $context,
            'time' => microtime(true),
        ];
        error_log("[HandlerTracker] set_exception_handler called: $context");
    }

    public static function restoreExceptionHandler(string $context = ''): void
    {
        restore_exception_handler(); 
        error_log("[HandlerTracker] restore_exception_handler called: $context");
    }

    public static function getErrorHandlerHistory(): array
    {
        return self::$errorHandlers;
    }

    public static function getExceptionHandlerHistory(): array
    {
        return self::$exceptionHandlers;
    }
}
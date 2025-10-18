<?php
class Seat {
    public function __construct(private string $owner) {}
    public function getOwner(): string {
        return $this->owner;
    }
}

class Seats {
    public function __construct(private array $seats) {}
    public static function fromOwners(string ...$owners): self {
        return new self(array_map(fn($o) => new Seat($o), $owners));
    }
    public function shuffle(): array {
        $shuffled = $this->seats;
        safe_key_int_shuffle($shuffled);
        return $shuffled;
    }
}

$seats = Seats::fromOwners(
    'zipper', 'takutaka', 'drumato', 'ressy', 'shibatch',
    'masaki', 'chiroru', 'ryu-ch', 'kmsn'
);

$shuffled = $seats->shuffle();
echo (fn($s) => implode("\n", [
    "| {$s[8]->getOwner()} | {$s[4]->getOwner()} |",
    "| {$s[7]->getOwner()} | {$s[3]->getOwner()} |",
    "| {$s[6]->getOwner()} | {$s[2]->getOwner()} |",
    "| {$s[5]->getOwner()} | {$s[1]->getOwner()} |",
    "| tnmt | {$s[0]->getOwner()} |"
]))($shuffled);

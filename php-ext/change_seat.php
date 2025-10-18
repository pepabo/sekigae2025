<?php
class Seat {
    private string $owner;
    public function __construct(string $owner) {
        $this->owner = $owner;
    }
    public function getOwner(): string {
        return $this->owner;
    }
}
class Seats {
    private array $seats;
    public function __construct(array $seats) {
        $this->seats = array_map(fn($s) => $s instanceof Seat ? $s : new Seat($s), $seats);
    }
    public function shuffle(): array {
        $shuffled = $this->seats;
        safe_key_int_shuffle($shuffled);
        return $shuffled;
    }
}

$seats = new Seats(['zipper','takutaka','drumato','ressy','shibatch','masaki','chiroru','ryu-ch','kmsn']);
[$first, $second, $third, $fourth, $fifth, $sixth, $seventh, $eighth, $ninth] = $seats->shuffle();

echo <<<EOD
| {$ninth->getOwner()} | {$fifth->getOwner()} |
| {$eighth->getOwner()} | {$fourth->getOwner()} |
| {$seventh->getOwner()} | {$third->getOwner()} |
| {$sixth->getOwner()} | {$second->getOwner()} |
| tnmt | {$first->getOwner()} |

EOD;

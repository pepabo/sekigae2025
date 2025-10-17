use std::collections::BTreeMap;

use rand::seq::SliceRandom;
use rand::thread_rng;
use rand::SeedableRng;
use rand_chacha::ChaCha20Rng;
use serde_json::json;

/* Usage:
   - cargo run           // 毎回ランダム
   - SEED=42 cargo run   // 固定シードで再現
*/

fn main() {
    let mut names = vec!["zipper", "takutaka", "drumato", "ressy", "shibatch", "masaki", "chiroru", "ryu-ch", "kmsn"];
   
    if let Ok(seed_str) = std::env::var("SEED") {
        let seed: u64 = seed_str.parse().unwrap_or(0);
        let mut rng = ChaCha20Rng::seed_from_u64(seed);
        names.shuffle(&mut rng);
    } else {
        let mut rng = thread_rng();
        names.shuffle(&mut rng);
    }

    let map: BTreeMap<usize, &str> = (1..=names.len()).zip(names.iter().copied()).collect();
    println!("{}", serde_json::to_string_pretty(&json!(map)).unwrap());
}
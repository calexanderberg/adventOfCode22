fn main() {
    let args: Vec<String> = std::env::args().collect();

    let _status = std::process::Command::new("rustc")
        .arg(format!("./{}/{}/rust.rs", args[1], args[2]))
        .status()
        .expect("Failed to execute process");
}

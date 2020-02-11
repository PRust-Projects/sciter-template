#![windows_subsystem = "windows"]

#[macro_use]
extern crate sciter;

mod load_handler;

struct EventHandler {}

impl EventHandler {}

impl sciter::EventHandler for EventHandler {

    dispatch_script_call! {
    }

}

fn main() {
    let _ = sciter::set_options(sciter::RuntimeOptions::DebugMode(true));

    let resources = include_bytes!("resources.rc");
    let handler = load_handler::LoadHandler::new(resources);
    let event_handler = EventHandler{};

    let mut frame = sciter::window::Builder::main_window()
        .with_size((500, 275))
        .create();

    frame.sciter_handler(handler);
    frame.event_handler(event_handler);
    frame.load_file("this://app/html/index.htm");

    frame.run_app();
}


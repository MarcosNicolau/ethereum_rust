use crate::primitives::U256;

#[derive(Debug, Clone, Default)]
pub struct Memory {
    data: Vec<u8>,
}

impl From<Vec<u8>> for Memory {
    fn from(data: Vec<u8>) -> Self {
        Memory { data }
    }
}

impl Memory {
    pub fn new() -> Self {
        Self { data: Vec::new() }
    }

    fn resize(&mut self, offset: usize) {
        if offset.next_multiple_of(32) > self.data.len() {
            self.data.resize(offset.next_multiple_of(32), 0);
        }
    }

    pub fn load(&mut self, offset: usize) -> U256 {
        self.resize(offset + 32);
        let value_bytes: [u8; 32] = self
            .data
            .get(offset..offset + 32)
            .unwrap()
            .try_into()
            .unwrap();
        U256::from(value_bytes)
    }

    pub fn load_range(&mut self, offset: usize, size: usize) -> Vec<u8> {
        self.resize(offset + size);
        self.data.get(offset..offset + size).unwrap().into()
    }

    pub fn store_bytes(&mut self, offset: usize, value: &[u8]) {
        let len = value.len();
        self.resize(offset + len);
        self.data
            .splice(offset..offset + len, value.iter().copied());
    }

    pub fn size(&self) -> U256 {
        U256::from(self.data.len())
    }

    pub fn copy(&mut self, src_offset: usize, dest_offset: usize, size: usize) {
        let max_size = std::cmp::max(src_offset + size, dest_offset + size);
        self.resize(max_size);
        let mut temp = vec![0u8; size];

        temp.copy_from_slice(&self.data[src_offset..src_offset + size]);

        self.data[dest_offset..dest_offset + size].copy_from_slice(&temp);
    }
}

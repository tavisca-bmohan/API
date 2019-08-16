using System;
using Xunit;

namespace XUnitTestProject1
{
    public class UnitTestForAPI
    {
        private ValuesController controller = new ValuesController();

        [Fact]
        public void TestForInputHi()
        {
            Assert.Equal("Hello", controller.Get("hi"));
        }

        [Fact]
        public void TestForInputHello()
        {
            Assert.Equal("Hi", controller.Get("hello"));
        }

        [Fact]
        public void TestForInvalidInput()
        {
            Assert.Equal("Invalid Input", controller.Get("hi ABC"));
        }
    }
}

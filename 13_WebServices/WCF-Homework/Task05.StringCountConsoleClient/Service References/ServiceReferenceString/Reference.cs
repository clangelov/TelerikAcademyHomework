﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Task05.StringCountConsoleClient.ServiceReferenceString {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReferenceString.IStringCounter")]
    public interface IStringCounter {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IStringCounter/FindWordOccurance", ReplyAction="http://tempuri.org/IStringCounter/FindWordOccuranceResponse")]
        int FindWordOccurance(string text, string lookingFor);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IStringCounter/FindWordOccurance", ReplyAction="http://tempuri.org/IStringCounter/FindWordOccuranceResponse")]
        System.Threading.Tasks.Task<int> FindWordOccuranceAsync(string text, string lookingFor);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IStringCounterChannel : Task05.StringCountConsoleClient.ServiceReferenceString.IStringCounter, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class StringCounterClient : System.ServiceModel.ClientBase<Task05.StringCountConsoleClient.ServiceReferenceString.IStringCounter>, Task05.StringCountConsoleClient.ServiceReferenceString.IStringCounter {
        
        public StringCounterClient() {
        }
        
        public StringCounterClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public StringCounterClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public StringCounterClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public StringCounterClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public int FindWordOccurance(string text, string lookingFor) {
            return base.Channel.FindWordOccurance(text, lookingFor);
        }
        
        public System.Threading.Tasks.Task<int> FindWordOccuranceAsync(string text, string lookingFor) {
            return base.Channel.FindWordOccuranceAsync(text, lookingFor);
        }
    }
}